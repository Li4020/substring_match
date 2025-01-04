open Type;;
open Print;;
open Util;;

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

let reindex_nfa a start = {
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

let rec compile: o_regex -> onfa = function
  | Eps -> null_nfa
  | Char a -> char_nfa a
  | Any -> char_nfa '.'
  | Query (sgn, o_name) -> query_nfa sgn o_name
  | Alt (a, b) -> union_nfa (compile a) (compile b)
  | Seq (a, b) -> concat_nfa (compile a) (compile b)
  | Star a -> star_nfa (compile a)
  | Opt a -> compile (Alt (a, Eps))
  | Plus a -> compile (Seq (a, Star a))

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
            (* print_query x.qry;
            print_bool (is_proceedable x.qry);
            print_newline (); *)
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

let initial onfa ith_oracle_vals =
  beta_reachable onfa (onfa.start) ith_oracle_vals

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

let rec reverse_o_regex: o_regex -> o_regex = function
  | Eps -> Eps
  | Char a -> Char a
  | Any -> Any
  | Query (sgn, o_name) -> Query (sgn, o_name)
  | Seq (a, b) -> Seq (reverse_o_regex b, reverse_o_regex a)
  | Alt (a, b) -> Alt (reverse_o_regex a, reverse_o_regex b)
  | Star a -> Star (reverse_o_regex a)
  | Opt a -> Opt (reverse_o_regex a)
  | Plus a -> Plus (reverse_o_regex a)

let match_onfa dir o_regex str oracle_matrix =
  let oracle_matrix = if Array.length oracle_matrix = 0 then [|Array.make ((String.length str) + 1) 0|] else oracle_matrix in
  let str_length = String.length str in
  let () = assert (Array.length oracle_matrix.(0) = str_length + 1) in
  let oracle_matrix' = transpose oracle_matrix in
  let onfa = if dir then compile o_regex else compile (reverse_o_regex o_regex) in
  (* print_onfa onfa; *)
  let i = ref (if dir then 0 else str_length) in
  let i' = ref (if dir then 0 else str_length - 1) in
  let states = ref (initial onfa oracle_matrix'.(!i)) in
  let tape = Array.make (str_length + 1) 0 in
  let init_tape = if not (StateSet.disjoint !states (onfa.final)) then tape.(!i) <- 1 else tape.(!i) <- 0 in
  let d = if dir then 1 else -1 in
  for j = 0 to str_length - 1 do
    states := next onfa !states str.[!i'] oracle_matrix'.(!i + d);
    (* print_newline ();
    StateSet.iter (fun x -> x |> print_int; print_string ", ") !states;
    print_newline ();
    print_newline (); *)
    if not (StateSet.disjoint !states (onfa.final)) then
      tape.(!i + d) <- 1
    else
      tape.(!i + d) <- 0;
    i := !i + d;
    i' := !i' + d
  done;
  tape

let o_matrix: int array Dynarray.t ref = ref (Dynarray.create ())
let o_matrix': int array Dynarray.t ref = ref (Dynarray.create ())

let o_regex': o_regex option ref = ref (None)

let rec eval_aux (regex: regex) str o_arity o_matrix: int * o_regex =
  let set_tape tape =
    Dynarray.add_last !o_matrix tape;
  in
  match regex with
    | Eps -> (0, Eps)
    | Char a ->
      (0, Char a)
    | Any -> (0, Any)
    | Seq (r1, r2) ->
      let (k1, s1) = eval_aux r1 str o_arity o_matrix in
      let (k2, s2) = eval_aux r2 str (o_arity + k1) o_matrix in
      (k1 + k2, Seq (s1, s2))
    | Alt (r1, r2) ->
      let (k1, s1) = eval_aux r1 str o_arity o_matrix in
      let (k2, s2) = eval_aux r2 str (o_arity + k1) o_matrix in
      (k1 + k2, Alt (s1, s2))
    | Star r1 ->
      let (k, s) = eval_aux r1 str o_arity o_matrix in
      (k, Star s)
    | Opt r1 ->
      let (k, s) = eval_aux r1 str o_arity o_matrix in
      (k, Opt s)
    | Plus r1 ->
      let (k, s) = eval_aux r1 str o_arity o_matrix in
      (k, Plus s)
    (* ?= *)
    | PLA r1 ->
      let pla_tape = eval false r1 str in
      set_tape pla_tape;
      (1, Query (true, o_arity))
    (* ?! *)
    | NLA r1 ->
      let nla_tape = eval false r1 str in
      set_tape nla_tape;
      (1, Query (false, o_arity))
    (* ?<= *)
    | PLB r1 ->
      let plb_tape = eval true r1 str in
      set_tape plb_tape;
      (1, Query (true, o_arity))
    (* ?<! *)
    | NLB r1 ->
      let nlb_tape = eval true r1 str in
      set_tape nlb_tape;
      (1, Query (false, o_arity))

and eval dir regex str =
  let (o_arity, o_regex) = eval_aux regex str 0 o_matrix in
  o_regex' := Some o_regex;
  match_onfa dir o_regex str (Dynarray.to_array !o_matrix)

let clear () =
  o_matrix := Dynarray.create ();
  o_matrix' := Dynarray.create ();