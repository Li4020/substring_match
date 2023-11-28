open Lib;;
open Suffix_tree;;

let () = print_endline "Hello, World!"

let a = Ukkonen.create "ccccaabb"

let () = print_int (Ukkonen.substring a "ccc") |> print_newline

let () = Ukkonen.print Format.std_formatter a

let () = Ukkonen.suffix_array a


let b = Ukkonen.find a "ccc";;
