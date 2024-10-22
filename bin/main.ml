open Lib;;
open Format;;
open Type;;
open Print;;
open Queue;;
open Trie;;


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

(* .*Q+(0)bcQ+(1) *)
let o_regex: o_regex = Seq (Star Any, (Seq (Query (true, 0), Seq (Char 'b', Seq (Char 'c', Query (true, 1))))))

(* let o_regex = Alt (Query (true, 0), Query (true, 1)) *)

(* let oracle_arity = 2 *)

(* let oracle_matrix = [|[|0; 0; 0; 0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1|]; [|1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0; 0; 0; 0; 0|]|] *)















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
  (* print_char (sym);
  print_newline ();
  StateSet.iter (fun x -> Printf.printf "%d" x; Printf.printf ", ") (beta_reachable onfa next_states_from_current_states ith_oracle_vals); *)
  beta_reachable onfa next_states_from_current_states ith_oracle_vals

let transpose matrix =
  let matrix' = Array.make_matrix (Array.length matrix.(0)) (Array.length matrix) 0 in
  for i = 0 to Array.length matrix - 1 do
    for j = 0 to Array.length matrix.(0) - 1 do
      matrix'.(j).(i) <- matrix.(i).(j)
    done
  done;
  matrix'

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
  (* print onfa; *)
  let i = ref (if dir then 0 else str_length) in
  let i' = ref (if dir then 0 else str_length - 1) in
  let states = ref (initial onfa oracle_matrix'.(!i)) in
  let tape = Array.make (str_length + 1) 0 in
  let init_tape = if not (StateSet.disjoint !states (onfa.final)) then tape.(!i) <- 1 else tape.(!i) <- 0 in
  let d = if dir then 1 else -1 in
  for j = 0 to str_length - 1 do
    states := next onfa !states str.[!i'] oracle_matrix'.(!i + d);
    if not (StateSet.disjoint !states (onfa.final)) then
      tape.(!i + d) <- 1
    else
      tape.(!i + d) <- 0;
    i := !i + d;
    i' := !i' + d
  done;
  tape



type regex =
  | Eps
  | Char of char
  | Any
  | Seq of regex * regex
  | Alt of regex * regex
  | Star of regex
  | Plus of regex
  | Opt of regex
  | PLA of regex
  | NLA of regex
  | PLB of regex
  | NLB of regex


let o_matrix: int array Dynarray.t ref = ref (Dynarray.create ())


let rec eval_aux (regex: regex) str o_arity o_matrix: int * o_regex =
  let set_tape tape =
    Dynarray.add_last !o_matrix tape;
    (* Dynarray.iter (fun x -> Array.iter (fun y -> y |> print_int; print_string ", ") x; print_string "\n") !o_matrix *)
  in
  match regex with
    | Eps -> (0, Eps)
    | Char a ->
      (0, Char a)
    | Any -> (0, Any)
    | Seq (r1, r2) ->
      let (k1, s1) = eval_aux r1 str o_arity o_matrix in
      let (k2, s2) = eval_aux r2 str (o_arity + k1) o_matrix in
      print_o_regex s1;
      print_o_regex s2;
      print_newline ();
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
  (* print (compile o_regex); *)
  match_onfa dir o_regex str (Dynarray.to_array !o_matrix)

(* let mat : int array Dynarray.t ref = ref (Dynarray.create ())
let rec a x =
  (* let mat : int array Dynarray.t ref = ref (Dynarray.create ()) in *)
  Dynarray.add_last !mat [|x|];
  b mat x
and b mat x =
  Dynarray.iter (fun x -> Array.iter (fun y -> y |> print_int; print_string ", ") x; print_string "\n") !mat;
  if x > 0 then a (x-1) else !mat

let () = Dynarray.iter (fun x -> Array.iter (fun y -> y |> print_int; print_string ", ") x; print_string "\n") (a 5) *)




(* let re: regex = PLA (Seq (Char 'a', Seq (Char 'b', Char 'c'))) *)
let re: regex = Seq (Char 'c', PLA (Seq (Char 'a', Char 'b')))

let re2 : regex = Seq (Star Any, (Seq (PLB (Seq (Star Any, Seq (Char 'a', Star Any))), Seq (Char 'b', Seq (Char 'c', (PLA (Seq (Star Any, Seq (Char 'd', Star Any)))))))))

let re3 : regex = Seq (Star Any, (Seq (PLB (Seq (Star Any, Seq (Char 'a', Star Any))), Seq (Char 'b', (PLA (Seq (Star Any, Seq (Char 'd', Star Any))))))))

let re4 : regex = Seq (Star Any, (Seq (PLB (Seq (Star Any, Seq (Char 'a', Star Any))), Seq (Char 'b', Seq (Char 'b', (PLA (Seq (Star Any, Seq (Char 'd', Star Any)))))))))


let string = "bbbcabbcbbdbbbc"


let () = Array.iter (fun x -> x |> print_int; print_string ", ") (eval true re4 string) |> print_newline

let () = print_endline string



(* 新しいtrie木を作成 *)
(* let tree = create ();; *)

(* "010"をtrie木に追加 *)
(* let tree = set tree ['0'; '1'; '0'] "value_010";; *)

(* "10"をtrie木に追加 *)
(* let tree = set tree ['1'; '0'] "value_10";; *)

(* "0"をtrie木に追加 *)
(* let tree = set tree ['0'] "value_0";; *)

(* 結果を確認するための関数 *)
let print_tree tree =
  iter (fun key value ->
    match value with
    | None -> ()
    | Some v -> Printf.printf "Key: %c, Value: %d\n" key v
  ) tree;;


let rec print_trie ?(indent=0) tree =
  let indent_str = String.make indent ' ' in
  let print_node node =
    let value_str = 
      match node.Node.value with
      | None -> -1
      | Some v -> v
    in
    Printf.printf "%sKey: %c, Value: %d\n" indent_str node.Node.key value_str;
    print_trie ~indent:(indent + 2) node.Node.children
  in
  List.iter print_node tree

(* trie木を表示 *)
(* let () =print_trie tree *)

let create_suffix_list string =
  let string_list = List.of_seq (String.to_seq string) in
  let rec aux acc str =
    match str with
    | [] -> []
    | h :: tl ->
      ((String.of_seq (List.to_seq tl)) :: acc) @ aux acc tl
  in
  aux [string] string_list

(* let create_suffix_list string =
  let string_list = List.of_seq (String.to_seq string) in
  let rec aux acc str =
    match str with
    | ['$'] -> acc
    | h :: tl ->
      aux ((String.of_seq (List.to_seq tl)) :: acc) tl
  in
  List.rev (aux [string ^ "$"] (string_list @ ['$'])) *)

let create_suffix_list string =
  let string_list = List.of_seq (String.to_seq string) in
  let rec aux acc str =
    match str with
    | [] -> acc
    | h :: tl ->
      aux ((String.of_seq (List.to_seq tl)) :: acc) tl
  in
  List.rev (List.tl (aux [string] string_list))

let create_suffix_tree string pos =
  let init_tree: (char, int) Node.t list = create () in
  let set_one_suffix tree suffix number =
    let char_list = suffix |> String.to_seq |> List.of_seq in
    set tree char_list number
  in
  let rec eliminate list pos =
    if pos = 0 then [] else
    match list with
    | [] -> []
    | h :: tl -> h :: eliminate tl (pos - 1)
  in
  let suffix_list = eliminate (create_suffix_list string) pos in
  let number_list = List.mapi (fun i v -> i + 1) suffix_list in
  List.fold_left2 (fun acc x y -> set_one_suffix acc x y) init_tree suffix_list number_list

(* 子が一つのときは枝刈り *)

let str = "01100100010111"
(* let str = "01100100" *)

(* let () = List.iter (fun x -> print_string x; print_string "\n") (create_suffix_list str)
let () = print_int (List.length (create_suffix_list str)) *)

let suffix_tree = create_suffix_tree str 8

(* let () = List.iter (fun x -> print_char x.Node.key; print_int (Option.get x.Node.value)) suffix_tree *)
(* let () = print_trie suffix_tree *)





let tree_thesis = create ()
let tree_thesis = set tree_thesis ['0'; '0'; '0'] 7
let tree_thesis = set tree_thesis ['0'; '0'; '1'; '0'; '0'] 4
let tree_thesis = set tree_thesis ['0'; '0'; '1'; '0'; '1'] 8
let tree_thesis = set tree_thesis ['0'; '1'; '0'] 5
let tree_thesis = set tree_thesis ['0'; '1'; '1'] 1
let tree_thesis = set tree_thesis ['1'; '0'; '0'; '0'] 6
let tree_thesis = set tree_thesis ['1'; '0'; '0'; '1'] 3
let tree_thesis = set tree_thesis ['1'; '1'] 2

let () = print_trie tree_thesis



match_onfa


(* ノードを幅優先に探索する関数 *)
let bfs_trie (root: ('a, 'b) Node.t list) (o_regex: o_regex) oracle_matrix =
  (* キューを初期化し、ルートのリストをすべてキューに追加 *)
  let queue = Queue.create () in
  List.iter (fun node -> Queue.push ([node.Node.key], node) queue) root;

  (* match_onfaから一部分移植 *)
  let oracle_matrix = if Array.length oracle_matrix = 0 then [|Array.make ((String.length str) + 1) 0|] else oracle_matrix in
  let oracle_matrix' = transpose oracle_matrix in
  let onfa = compile o_regex in
  (* print onfa; *)
  let i = ref 0 in
  (* いらなさそう *)
  let i' = ref 0 in
  let states = ref (initial onfa oracle_matrix'.(!i)) in
  (* これどうする？ *)
  (* 最後に作るテープarrayじゃなくてlistで管理してよくないか？disjointなら0を、そうでないなら1をくっつける *)
  let tape = Array.make (str_length + 1) 0 in
  let init_tape = if not (StateSet.disjoint !states (onfa.final)) then tape.(!i) <- 1 else tape.(!i) <- 0 in
  let d = 1 in


  (* 幅優先探索を再帰的に行う補助関数 *)
  let rec aux () =
    if Queue.is_empty queue then
      ()
    else
      let (path, current) = Queue.pop queue in
      (* 現在のノードを処理 *)
      (match current.Node.value with
      | None -> ()  (* 値がない場合は何もしない *)
      | Some value -> 
          Printf.printf "Found value: %s at path: %s\n" 
            (string_of_int value) (* 'b型に応じて出力を変更 *)
            (String.concat "->" (List.map (String.make 1) path)));

      (* 子ノードをキューに追加 *)
      List.iter (fun child ->
        Queue.push (path @ [child.Node.key], child) queue
      ) current.Node.children;

      (* 再帰呼び出しで次のノードを処理 *)
      aux ()
  in

  aux ()  (* 幅優先探索の開始 *)


let () = bfs_trie tree_thesis







(*


(* ================================================================================ *)
let () = print_newline ()
let () = print_endline "===================================================================="

let () = print_o_regex o_regex; print_newline ()

let () = print (compile o_regex)

(* let () = print_matrix oracle_matrix *)

(* let () = StateSet.iter (fun x -> x |> print_int; print_string ", ") (beta_reachable (compile o_regex) (StateSet.of_list [4]) [|1;0|]); print_newline () *)

(* let () = StateSet.iter (fun x -> x |> print_int; print_string ", ") (initial (compile o_regex) [|1;0|]); print_newline () *)

(* let () = StateSet.iter (fun x -> x |> print_int; print_string ", ") (next (compile o_regex) (StateSet.of_list [0]) 'b' [|1;0|]) *)

let () = print_matrix (transpose oracle_matrix)

let () = print_o_regex (reverse_o_regex o_regex); print_newline ()

let () = Array.iter (fun x -> x |> print_int; print_string ", ") (match_onfa true o_regex string oracle_matrix)


*)

let o_regex: o_regex = Star (Alt (Char '0', Char '1'))

let () = print (compile o_regex)