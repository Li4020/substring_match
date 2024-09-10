open Lib;;
open Suffix_tree;;
open Format;;
open Dfa;;
open Nfa;;
open Regex;;

let suf_tree = Ukkonen.create "00010"

(* let suf_tree = Ukkonen.create "00010" *)
let out = Ukkonen.print Format.std_formatter (Ukkonen.create "00010")


(* let rec g = match a.tree_root.node_type with
  | Leaf l -> print_int l
  |  *)


(* type state = int32 *)
let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) []


(* module SS = StateSet *)

let r = parse "0*1"

let nfa = compile r
let dfa = compile r |> determinize

(* let b = StateSet.iter (fun x -> Int32.to_int x |> print_int |> print_newline ) dfa.finals *)

(* let () = Dfa.accept dfa (explode ("a")) |> print_bool *)

(* let () = Int32.to_int (dfa.start) |> print_int |> print_newline *)

module B = Bmap(CharString)

(* ok *)
(* Someは行き先あり、Noneは行き先なし *)
(* 状態は1から始まる、つまりdfa.startが1 *)
let dfa_one_step (dfa: Dfa.dfa) present char =
  try
    let next = CharMap.find char (dfa.next present) in
    if StateSet.mem present dfa.finals then None else (Int32.to_int next |> print_int ; Some next)
  with
    | Not_found -> None


let aaa = dfa_one_step (dfa: Dfa.dfa) dfa.start '0'

(* okだと思ったがちょっと怪しいぞ *)
let suf_tree_one_step suf_tree (present: Ukkonen.node) char =
  try
    match present.node_type with
      | Leaf l -> None
      | Branch b -> Some (B.find b char)
  with
    | Not_found -> None


let aaaaa = suf_tree_one_step suf_tree suf_tree.tree_root '0'
(* match (dfa, suf_tree) with
  | (a, b) ->
  |  *)

(* let () = dfa_one_step (dfa: Dfa.dfa) dfa.start '0' |> Int32.to_int |> print_int |> print_newline *)

(* let () = nfa.next (StateSet.choose nfa.start) |>  *)

(* CharMap.iter (fun x y -> print_char x; print_char ','; Int32.to_int y |> print_int |> print_newline) *)

    (* if StateSet.mem (Char.code char |> Int32.of_int) dfa.finals
      then true
      else  *)



(* トライ木を探索する、それと同時にdfaを動かす *)
(* let search (dfa: Dfa.dfa) (suf_tree: Ukkonen.t) =
  let m = String.length suf_tree.tree_string in
  (* let next_state = dfa_one_step dfa  *)
  let rec search' (present_state: Nfa.state) (present_node: Ukkonen.node) =
    for i = 0 to 1 do
      let next_state = dfa_one_step (dfa: Dfa.dfa) present_state (Int.to_string i) in
      let next_node = suf_tree_one_step suf_tree (present_node: Ukkonen.node) char in
    (* match state, node.node_type with *)
    (* match dfa_one_step (dfa: Dfa.dfa) present char, suf_tree_one_step suf_tree (present: Ukkonen.node) char with *)
      match next_state, next_node with
        | None, None -> if StateSet.mem present_state dfa.finals then true else false
        | None, Some nn -> if StateSet.mem present_state dfa.finals then true else false
        | Some ns, None -> [0,1].map() search' next_state present_node 
        | Some ns, Some nn -> search' next_state next_node
    done; *)










(* let search_a (t: Ukkonen.t) =
  let m = String.length t.tree_string in
  let rec search' (node: Ukkonen.node) depth =
    let e = ref 0 in
    (* let label_end n = match node.node_type with
      | Leaf _ -> !e
      | Branch _ -> node.label_end
    in
    let e = label_end node in *)
    let e = node.label_end in
      match node.node_type with 
        (* | Leaf l -> print_endline "leaf"; print_int depth |> print_newline;  print_int l |> print_newline;  *)
        | Leaf l -> print_endline "leaf"; print_int depth |> print_newline;  print_int node.label_start |> print_newline; print_int e |> print_newline; 

        for i = node.label_start to e do
          print_int i |> print_newline;
          fprintf Format.std_formatter "%c"
            (if i == m+1 then '$' else String.unsafe_get t.tree_string (i-1));
          print_newline ();
        done;
        | Branch b -> print_endline "branch"; print_int depth|> print_newline; 
        for i = node.label_start to e do
          print_int i |> print_newline;
          fprintf Format.std_formatter "%c"
            (if i == m+1 then '$' else String.unsafe_get t.tree_string (i-1));
          print_newline ();
        done;
        B.iter (fun _ n -> search' n (depth+1)) b
  in
  search' t.tree_root 0 *)

(* let () = search a *)


(* let () = print_int (Ukkonen.substring a "000") |> print_newline *)

(* let () = Ukkonen.print Format.std_formatter a *)

(* let () = Ukkonen.suffix_array a;; *)

(* let b = Ukkonen.find a "d";;

let () = print_int b.pos_in_edge;;

let () = print_int b.pos_node.path_position;;

let () = match b.pos_node.node_type with
  | Branch br -> print_endline "branch"
  | Leaf _ -> print_endline "leaf"
;; *)