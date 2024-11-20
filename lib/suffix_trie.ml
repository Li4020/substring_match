open Trie;;
open Util;;
open Print;;

let str = "01100100010111"

let om2 = [|[|0; 0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1|]; [|1; 1; 1; 1; 1; 1; 0; 0; 0; 0; 0; 0; 0; 0; 0;|]|]

let create_suffix_list string =
  let string_list = List.of_seq (String.to_seq string) in
  let rec aux acc str =
    match str with
    | [] -> []
    | h :: tl ->
      ((String.of_seq (List.to_seq tl)) :: acc) @ aux acc tl
  in
  aux [string] string_list

let create_suffix_list string =
  let string_list = List.of_seq (String.to_seq string) in
  let rec aux acc str =
    match str with
    | [] -> acc
    | h :: tl ->
      aux ((String.of_seq (List.to_seq tl)) :: acc) tl
  in
  List.rev (List.tl (aux [string] string_list))

let create_char_list_with_o_vals o_mat pos l =
  let o_mat' = transpose o_mat in
  (None, o_mat'.(pos - 1)) :: List.mapi (fun i -> fun x -> (Some x, o_mat'.(pos + i))) l @ [(None, [||])]

let create_suffix_tree string pos o_mat =
  let init_tree: ('a, 'b) Node.t list = create () in
  let set_one_suffix tree suffix number =
    let char_list = suffix |> String.to_seq |> List.of_seq |> create_char_list_with_o_vals o_mat number in
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

let rec is_last_branch (trie: ('a, 'b) Node.t) =
  match trie.children with
  | [] -> false
  | [child] -> false
  | _ -> if List.exists is_last_branch trie.children then false else true

(* let prune (trie: ('a, 'b) Node.t list) =
  let rec prune' (trie: ('a, 'b) Node.t) =
    match trie.children with
    | [] -> trie (* 葉ノードなので変更しない *)
    | [child] ->
      (* 子ノードが1つだけなので、親ノードと子ノードを結合する *)
      let child' = prune' child in
      if is_last_branch child then
        { key = trie.key; value = child'.value; children = child'.children }
      else
        trie
    | _ ->
      (* 子ノードが2つ以上あるので、再帰的に子ノードを削減する *)
      let children' = List.map prune' trie.children in
      { key = trie.key; value = trie.value; children = children' }
  in
  List.map prune' trie *)

let counter = ref 0

(* もっとシンプルに考えたい。 *)

let prune (trie: ('a, 'b) Node.t list) =
  let rec prune' (trie: ('a, 'b) Node.t) =
    if is_last_branch trie then
      (* let () = Format.print_bool (is_last_branch trie) in *)
      let rec dfs (node: ('a, 'b) Node.t) =
        match node.children with
        | [] -> node
        | [child] ->
          let child' = child |> prune' |> dfs in
          { Node.key = node.key; value = child'.value; children = child'.children }
      in
      let key_sym = trie.key |> fst |> char_of_charoption in
      let key_o_vals = trie.key |> snd in
      let key_o_vals_str = Array.fold_left (fun acc x -> acc ^ (string_of_int x)) "" key_o_vals in
      let () = Printf.printf "Key: %c_%s\n" key_sym key_o_vals_str in
      let children' = List.map (fun x -> x |> dfs) trie.children in
      { Node.key = trie.key; value = trie.value; children = children' }
    else
      (* let () = Format.print_bool (is_last_branch trie) in *)
      (* let () = print_trie trie.children in *)
      let key_sym = trie.key |> fst |> char_of_charoption in
      let key_o_vals = trie.key |> snd in
      let key_o_vals_str = Array.fold_left (fun acc x -> acc ^ (string_of_int x)) "" key_o_vals in
      let () = Printf.printf "Key: %c_%s\n" key_sym key_o_vals_str in
      let children' = List.map prune' trie.children in
      { Node.key = trie.key; value = trie.value; children = children' }
  in
  List.map prune' trie

(* let () =
  let trie = create () in
  let trie = set trie ['k'; 'e'] "value" in
  let trie = set trie ['k'; 'e'; 'y'; '1'] "value1" in
  let trie = set trie ['k'; 'e'; 'y'; '2'; '3'] "value2" in
  let result = is_last_branch (sub_node trie ['k'; 'e'; 'y'; '2'; '3']) in
  Printf.printf "result: %b\n" result *)

let suffix_tree = create_suffix_tree str 8 om2

(* let () = print_trie_primitive (prune tree) *)























let tree_thesis = create ()
let tree_thesis = set tree_thesis (['0'; '0'; '0'] |> create_char_list_with_o_vals om2 7) 7
let tree_thesis = set tree_thesis (['0'; '0'; '1'; '0'; '0'] |> create_char_list_with_o_vals om2 4) 4
let tree_thesis = set tree_thesis (['0'; '0'; '1'; '0'; '1'] |> create_char_list_with_o_vals om2 8) 8
let tree_thesis = set tree_thesis (['0'; '1'; '0'] |> create_char_list_with_o_vals om2 5) 5
let tree_thesis = set tree_thesis (['0'; '1'; '1'] |> create_char_list_with_o_vals om2 1) 1
let tree_thesis = set tree_thesis (['1'; '0'; '0'; '0'] |> create_char_list_with_o_vals om2 6) 6
let tree_thesis = set tree_thesis (['1'; '0'; '0'; '1'] |> create_char_list_with_o_vals om2 3) 3
let tree_thesis = set tree_thesis (['1'; '1'] |> create_char_list_with_o_vals om2 2) 2
