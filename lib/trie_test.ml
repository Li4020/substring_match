(* open Lib.Trie;; *)
open Trie;;
open Suffix_tree;;

(* 
(* 新しいtrie木を作成 *)
let tree = create ();;

(* "010"をtrie木に追加 *)
let tree = set tree ['0'; '1'; '0'] "value_010";;

(* "10"をtrie木に追加 *)
let tree = set tree ['1'; '0'] "value_10";;

(* "0"をtrie木に追加 *)
let tree = set tree ['0'] "value_0";;

(* 結果を確認するための関数 *)
let print_tree tree =
  iter (fun key value ->
    match value with
    | None -> ()
    | Some v -> Printf.printf "Key: %c, Value: %s\n" key v
  ) tree;;

(* trie木を表示 *)
print_tree tree;; *)
