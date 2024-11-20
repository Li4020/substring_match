open Type;;
open Trie;;
open Util;;

let print_query = function
  | Q (sgn, o_name) ->
      print_char 'Q';
      if sgn then print_char '+' else print_char '-';
      print_char '('; print_int o_name; print_char ')'

let print_onfa onfa =
  onfa.states |> StateSet.iter (fun x -> x |> print_int; print_string ", ") |> print_newline;
  onfa.alph |> AlphSet.iter (fun x -> x |> print_char) |> print_newline;
  onfa.trans |> List.iter (fun (x:transition) -> print_char '('; print_int x.q; print_char ','; print_char x.sym; print_char ','; print_int x.q'; print_char ')'; print_string ", ") |> print_newline;
  onfa.etrans |> List.iter (fun (x:etransition) -> print_char '('; print_int x.eq; print_char ','; print_int x.eq'; print_char ')'; print_string ", ") |> print_newline;
  onfa.qtrans |> List.iter (fun (x:qtransition) -> print_char '('; print_int x.q; print_char ','; print_query x.qry; print_char ','; print_int x.q'; print_char ')'; print_string ", ") |> print_newline;
  onfa.start |> StateSet.iter (fun x -> x |> print_int; print_string ", ") |> print_newline;
  onfa.final |> StateSet.iter (fun x -> x |> print_int; print_string ", ") |> print_newline

let rec print_o_regex: o_regex -> unit = function
  | Eps -> print_string ""
  | Char a -> print_char a
  | Any -> print_char '.'
  | Query (sgn, o_name) -> print_query (Q (sgn, o_name))
  | Alt (a, b) -> print_char '('; print_o_regex a; print_char '|'; print_o_regex b; print_char ')'
  | Seq (a, b) -> print_char '('; print_o_regex a; print_o_regex b; print_char ')'
  | Star a -> print_char '('; print_o_regex a; print_char ')'; print_char '*';
  | Opt a -> print_char '('; print_o_regex a; print_char ')'; print_char '?';
  | Plus a -> print_char '('; print_o_regex a; print_char ')'; print_char '+'

let rec print_regex: regex -> unit = function
  | Eps -> print_string ""
  | Char a -> print_char a
  | Any -> print_char '.'
  | Alt (a, b) -> print_char '('; print_regex a; print_char '|'; print_regex b; print_char ')'
  | Seq (a, b) -> print_char '('; print_regex a; print_regex b; print_char ')'
  | Star a -> print_char '('; print_regex a; print_char ')'; print_char '*';
  | Opt a -> print_char '('; print_regex a; print_char ')'; print_char '?';
  | Plus a -> print_char '('; print_regex a; print_char ')'; print_char '+'
  | PLA a -> print_string "(?="; print_regex a; print_char ')';
  | PLB a -> print_string "(?<="; print_regex a; print_char ')';
  | NLA a -> print_string "(?!"; print_regex a; print_char ')';
  | NLB a -> print_string "(?<!"; print_regex a; print_char ')'

let print_matrix matrix =
  Array.iter (fun x -> Array.iter (fun y -> print_int y; print_string " ") x; print_newline()) matrix

(* ============================================================================== *)


let print_tree tree =
  iter (fun key value ->
    match value with
    | None -> ()
    | Some v -> Printf.printf "Key: %c, Value: %d\n" key v
  ) tree;;

let rec print_trie_primitive ?(indent=0) tree =
  let indent_str = String.make indent ' ' in
  let print_node node =
    let value_str = 
      match node.Node.value with
      | None -> -1
      | Some v -> v
    in
    let key_sym = node.Node.key in
    Printf.printf "%sKey: %c, Value: %d\n" indent_str key_sym value_str;
    print_trie_primitive ~indent:(indent + 2) node.Node.children
  in
  List.iter print_node tree

let rec print_trie ?(indent=0) tree =
  let indent_str = String.make indent ' ' in
  let print_node node =
    let value_int = 
      match node.Node.value with
      | None -> -1
      | Some v -> v
    in
    let key_sym = node.Node.key |> fst in
    let key_o_vals = node.Node.key |> snd in
    let key_o_vals_str = Array.fold_left (fun acc x -> acc ^ (string_of_int x)) "" key_o_vals in
    Printf.printf "%sKey: %c_%s, Value: %d\n" indent_str key_sym key_o_vals_str value_int;
    print_trie ~indent:(indent + 2) node.Node.children
  in
  List.iter print_node tree

let rec print_trie ?(indent=0) tree =
  let indent_str = String.make indent ' ' in
  let print_node node =
    let key_sym = node.Node.key |> fst |> char_of_charoption in
    let key_o_vals = node.Node.key |> snd in
    let key_o_vals_str = Array.fold_left (fun acc x -> acc ^ (string_of_int x)) "" key_o_vals in
    let value_int =
      match node.Node.value with
      | None -> -1
      | Some v -> v
    in
    Printf.printf "%sKey: %c_%s, Value: %d\n" indent_str key_sym key_o_vals_str value_int;
    print_trie ~indent:(indent + 2) node.Node.children
  in
  List.iter print_node tree