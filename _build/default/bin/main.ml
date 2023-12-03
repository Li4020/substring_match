open Lib;;
open Suffix_tree;;

let () = print_endline "Hello, World!"

let a = Ukkonen.create "banana"

(* let () = print_int (Ukkonen.substring a "000") |> print_newline

let () = Ukkonen.print Format.std_formatter a

let () = Ukkonen.suffix_array a *)


let b = Ukkonen.find a "na";;

let () = print_int b.pos_node.label_start

let () = match b.pos_node.node_type with
  | Branch b -> 
    print_endline "branch"
  | Leaf _ -> print_endline "leaf"
;;
