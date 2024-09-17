open Lib;;
open Format;;
open Dfa;;
open Nfa;;
open Regex;;

type query = Q of bool * int
type t =
  | Eps
  | Char of char
  | Any
  | Query of bool * int
  | Seq of t * t
  | Alt of t * t
  | Star of t
  | Plus of t
  | Opt of t

module StateSet = Set.Make(Int)
module AlphSet = Set.Make(Char)

type transition = {q: int; sym: char; q' : int}
type etransition = {eq: int; eq' : int}
type qtransition = {q: int; qry: query; q' : int}

type onfa = {
  states : StateSet.t;
  alph : AlphSet.t;
  trans : transition list;
  etrans : etransition list;
  qtrans : qtransition list;
  start : StateSet.t;
  final : StateSet.t;
}

let null_nfa = {
  states = StateSet.of_list [0; 1];
  alph = AlphSet.empty;
  trans = [];
  etrans = [{eq = 0; eq' = 1}];
  qtrans = [];
  start = StateSet.of_list [0];
  final = StateSet.of_list [1];
}

let query_nfa sgn o_name = {
  states = StateSet.of_list [0; 1];
  alph = AlphSet.empty;
  trans = [];
  etrans = [];
  qtrans = [{q = 0; qry = Q(sgn, o_name); q' = 1}];
  start = StateSet.of_list [0];
  final = StateSet.of_list [1];
}

let char_nfa a = {
  states = StateSet.of_list [0; 1];
  alph = AlphSet.singleton a;
  trans = [{q = 0; sym = a; q' = 1}];
  etrans = [];
  qtrans = [];
  start = StateSet.of_list [0];
  final = StateSet.of_list [1];
}

(* let reindexList l start =
  List.map (fun x -> x + start) l *)

let reindex_nfa a start ={
  states = StateSet.map (fun x -> x + start) a.states;
  alph = a.alph;
  trans = List.map (fun (x: transition) -> {q = x.q + start; sym = x.sym; q' = x.q' + start}) a.trans;
  etrans = List.map (fun (x: etransition) -> {eq = x.eq + start; eq' = x.eq' + start}) a.etrans;
  qtrans = List.map (fun (x: qtransition) -> {q = x.q + start; qry = x.qry; q' = x.q' + start}) a.qtrans;
  start = StateSet.map (fun x -> x + start) a.start;
  final = StateSet.map (fun x -> x + start) a.final;
}

let concat_nfa a b =
  let concat_nfa' a b = {
    states = StateSet.union a.states b.states;
    alph = AlphSet.union a.alph b.alph;
    trans = a.trans @ b.trans;
    etrans = (List.map2 (fun x y -> {eq = x; eq' = y}) (StateSet.elements a.final) (StateSet.elements b.start)) @ (a.etrans @ b.etrans);
    qtrans = a.qtrans @ b.qtrans;
    start = a.start;
    final = b.final;
  } in
  concat_nfa' (reindex_nfa a 0) (reindex_nfa b (StateSet.cardinal a.states))

let thompson a =
  let thompson' a start final = {
    states = StateSet.add start (StateSet.add final a.states);
    alph = a.alph;
    trans = a.trans;
    etrans = List.map (fun x -> {eq=start; eq'=x}) (StateSet.elements a.start) @ List.map (fun x -> {eq=x; eq'=final}) (StateSet.elements a.final) @ a.etrans;
    qtrans = a.qtrans;
    start = StateSet.singleton start;
    final = StateSet.singleton final;
  }in
  let start = StateSet.cardinal a.states in
  let final = StateSet.cardinal a.states + 1 in
  thompson' a start final

let union_nfa a b =
  let union_nfa' a b = {
    states = StateSet.union a.states b.states;
    alph = AlphSet.union a.alph b.alph;
    trans = a.trans @ b.trans;
    etrans = a.etrans @ b.etrans;
    qtrans = a.qtrans @ b.qtrans;
    start = StateSet.union a.start b.start;
    final = StateSet.union a.final b.final;
  } in
  union_nfa' (reindex_nfa a 0) (reindex_nfa b (StateSet.cardinal a.states))
  |> thompson

let star_nfa a =
  let star_nfa' a start final = {
    states = StateSet.add start (StateSet.add final a.states);
    alph = a.alph;
    trans = a.trans;
    etrans = {eq = start; eq' = final} :: List.map (fun x -> {eq=start; eq'=x}) (StateSet.elements a.start) @ List.map (fun x -> {eq=x; eq'=final}) (StateSet.elements a.final) @ (List.map2 (fun x y -> {eq=x; eq'=y}) (StateSet.elements a.final) (StateSet.elements a.start)) @ a.etrans;
    qtrans = a.qtrans;
    start = StateSet.singleton start;
    final = StateSet.singleton final;
  }in
  let start = StateSet.cardinal a.states in
  let final = StateSet.cardinal a.states + 1 in
  star_nfa' a start final

let rec compile = function
  | Eps -> null_nfa
  | Char a -> char_nfa a
  | Any -> char_nfa '.'
  | Query (sgn, o_name) -> query_nfa sgn o_name
  | Alt (a, b) -> union_nfa (compile a) (compile b)
  | Seq (a, b) -> concat_nfa (compile a) (compile b)
  | Star a -> star_nfa (compile a)
  | Opt a -> compile (Alt (a, Eps))
  | Plus a -> compile (Seq (a, Star a))

let print_query = function
  | Q (sgn, o_name) ->
      print_char 'Q';
      if sgn then print_char '+' else print_char '-';
      print_char '('; print_int o_name; print_char ')'

let print onfa =
  onfa.states |> StateSet.iter (fun x -> x |> print_int; print_string ", ") |> print_newline;
  onfa.alph |> AlphSet.iter (fun x -> x |> print_char) |> print_newline;
  onfa.trans |> List.iter (fun (x:transition) -> print_char '('; print_int x.q; print_char ','; print_char x.sym; print_char ','; print_int x.q'; print_char ')'; print_string ", ") |> print_newline;
  onfa.etrans |> List.iter (fun (x:etransition) -> print_char '('; print_int x.eq; print_char ','; print_int x.eq'; print_char ')'; print_string ", ") |> print_newline;
  onfa.qtrans |> List.iter (fun (x:qtransition) -> print_char '('; print_int x.q; print_char ','; print_query x.qry; print_char ','; print_int x.q'; print_char ')'; print_string ", ") |> print_newline;
  onfa.start |> StateSet.iter (fun x -> x |> print_int; print_string ", ") |> print_newline;
  onfa.final |> StateSet.iter (fun x -> x |> print_int; print_string ", ") |> print_newline

(* .*Q+(0)bcQ+(1) *)
let o_regex = Seq (Star Any, (Seq (Query (true, 0), Seq (Char 'b', Seq (Char 'c', Query (true, 1))))))

(* let o_regex = Alt (Query (true, 0), Query (true, 1)) *)

let () = print (compile o_regex)


let string = "bbbcabbcbbdbbbc"
let oracle_arity = 2
let oracle_matrix = Array.make_matrix oracle_arity (String.length string + 1) 0

let print_matrix matrix =
  Array.iter (fun x -> Array.iter (fun y -> print_int y; print_string " ") x; print_newline()) matrix

let () = print_matrix oracle_matrix


let beta_reachable (nfa : onfa) (start_states : StateSet.t) (ith_oracle_vals : int array): StateSet.t =
  let rec beta_reachable' (visited : StateSet.t) (to_visit : StateSet.t) : StateSet.t =
    if StateSet.is_empty to_visit then visited
    else
      let current = StateSet.min_elt to_visit in
      let rest = StateSet.remove current to_visit in
      if StateSet.mem current visited then
        beta_reachable' visited rest
      else
        let new_states_by_epsilon =
          List.fold_left (fun acc (x: etransition) ->
            if x.eq = current && not (StateSet.mem x.eq' visited) then
              StateSet.add x.eq' acc
            else
              acc
          ) StateSet.empty nfa.etrans
        in
        let new_states_by_oracle_query =
          List.fold_left (fun acc (x: qtransition) ->
            let is_proceedable qry =
              match qry with
                | Q (sgn, o_name) -> ith_oracle_vals.(o_name) = if sgn then 1 else 0
            in
            if x.q = current && not (StateSet.mem x.q' visited) && is_proceedable x.qry then
              StateSet.add x.q' acc
            else
              acc
          ) StateSet.empty nfa.qtrans
        in
        let new_states = StateSet.union new_states_by_epsilon new_states_by_oracle_query in
        beta_reachable' (StateSet.add current visited) (StateSet.union new_states rest)
  in
  beta_reachable' StateSet.empty start_states

let () = StateSet.iter (fun x -> x |> print_int; print_string ", ") (beta_reachable (compile o_regex) (StateSet.of_list [4]) [|1;0|]); print_newline ()

let initial onfa ith_oracle_vals =
  beta_reachable onfa (onfa.start) ith_oracle_vals

let () = StateSet.iter (fun x -> x |> print_int; print_string ", ") (initial (compile o_regex) [|1;0|]); print_newline ()

let next onfa current_states sym ith_oracle_vals =
  let next_states current_state =
    List.fold_left (fun acc (x:transition) ->
      if x.q = current_state && (x.sym = sym || x.sym = '.') then
        StateSet.add x.q' acc
      else
        acc
    ) StateSet.empty onfa.trans
  in
  let next_states_from_current_states =
    StateSet.fold (fun x acc ->
      StateSet.union (next_states x) acc
    ) current_states StateSet.empty
  in
  beta_reachable onfa next_states_from_current_states ith_oracle_vals

let () = StateSet.iter (fun x -> x |> print_int; print_string ", ") (next (compile o_regex) (StateSet.of_list [0]) 'b' [|1;0|])


let match dir o_regex str oracle_matrix =
  let str_length = String.length str in
  let () = assert Array.length oracle_matrix.(0) = str_length + 1 in
  (* elseの場合、reverseする *)
  let onfa = if dir then compile o_regex else compile o_regex in
  let i = if dir then 0 else str_length in
  (* i列目をとってくる *)
  let initial_power_states = initial onfa oracle_matrix.(i) in
  let tape = Array.make (str_length + 1) 0 in
  