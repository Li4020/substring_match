open Lib;;
open Util;;
open Format;;
open Type;;
open Print;;
open Queue;;
open Trie;;
open Converter;;
open Onfa;;
open Suffix_trie;;
open Suffix_tree;;
open Suffix_tree3;;



let time : (unit -> 'a) -> 'a * float =
  fun f ->
    let start = Sys.time () in
    let res   = f () in
    let end_  = Sys.time () in
    (res, end_ -. start)


let str = "01100100010111"
(* let str = Sys.argv.(1) *)
let my_re_str = "(?<=.*11.*)00(?=.*100.*)"
let my_re_str' = ".*(?<=.*11.*)00(?=.*100.*)"
let my_re = my_re_str |> parse_regex
let my_re' = my_re_str' |> parse_regex
let ans_tape' = eval true my_re' str
let o_matrix = (!Onfa.o_matrix |> Dynarray.to_array)
let answer = time (fun () -> match_onfa true (Option.get !o_regex') str o_matrix)
let () = Array.iter (fun x -> x |> print_int; print_string ", ") (fst answer) |> print_newline
let () = print_float (snd answer) |> print_newline

let () = Onfa.o_matrix := (Dynarray.create ())
let ans_tape = eval true my_re str







let o_matrix = if Dynarray.is_empty !Onfa.o_matrix then [|Array.make ((String.length str) + 1) 0|] else (!Onfa.o_matrix |> Dynarray.to_array)


let create_data (s : string) (matrix : int array array) =
  let n = String.length s in
  (* let () = print_int (Array.length matrix) in *)
  if n <> Array.length matrix - 1 then
    invalid_arg "The length of the string must match the number of rows in the matrix.";
  let rec aux i acc =
    if i < 0 then acc
    else aux (i - 1) ((Some s.[i], matrix.(i + 1)) :: acc)
  in
  (None, matrix.(0)) :: aux (n - 1) []


let create_data (s : string) (matrix : int array array) =
  let n = String.length s in
  (* let () = print_int (Array.length matrix) in *)
  if n <> Array.length matrix - 1 then
    invalid_arg "The length of the string must match the number of rows in the matrix.";
  let rec aux i acc =
    if i < 0 then acc
    else aux (i - 1) ((s.[i], matrix.(i + 1)) :: acc)
  in
  ('-', matrix.(0)) :: aux (n - 1) []

(* let complex_data = [
  (None, [|1; 2|]);
  (Some 'y', [|3; 4|]);
  (Some 'z', [|5; 6; 7|]);
  (Some 'x', [|8|]);
  (Some 'y', [|3; 4|]);
  (Some 'z', [|5; 6; 7|]);
  (Some 'x', [|8|]);
  (Some 'y', [|3; 4|]);
  (Some 'z', [|5; 6; 7|]);
  (Some 'x', [|8|]);
  (Some 'y', [|3; 4|]);
  (Some 'z', [|5; 6; 7|]);
  (Some 'x', [|8|]);
  (Some 'y', [|3; 4|]);
  (Some 'z', [|5; 6; 7|]);
  (Some 'x', [|8|]);
] *)

let complex_data = [
  ('a', [|1; 2; 3|]);
  ('b', [|4; 5; 6|]);
  ('c', [|7; 8; 9|]);
  ('a', [|10; 11; 12|]);
  ('b', [|13; 14; 15|]);
  ('c', [|7; 8; 9|]);
  ('a', [|10; 11; 12|]);
  ('b', [|13; 14; 15|]);
]


let tr = SuffixTree3.build complex_data



let () = SuffixTree3.print_tree_intervals tr





let data = create_data str (transpose o_matrix)

let () = print_int (List.length data)

(* let () = List.iter (fun x -> print_char (char_of_charoption (fst x)) ; print_string ", ") data *)
(* let () = List.iter (fun x -> print_char (char_of_charoption (fst x)) ; Array.iter (fun y -> print_int y) (snd x); print_string ", ") data *)























let trrrrr = SuffixTree3.build data

let () = SuffixTree3.print_tree_intervals trrrrr

(* let suffix_tree_with_time = (fun () -> SuffixTree.build data) |> time *)


(* let suffix_tree = fst suffix_tree_with_time *)










