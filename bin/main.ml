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

let time : (unit -> 'a) -> 'a * float =
  fun f ->
    let start = Sys.time () in
    let res   = f () in
    let end_  = Sys.time () in
    (res, end_ -. start)



(* let b = is_last_branch (List.nth suffix_tree 2) *)

(* let () = print_trie (suffix_tree) *)

(* let () = print_int !counter' *)


(* let () = print_newline ()
let () = print_newline ()
let () = print_newline ()

let () = print_trie suffix_tree *)

(* let () = print_endline Sys.argv.(1);; *)
let str = "01100100010111"
let str = Sys.argv.(1)


let my_re_str = "(?:a*)*(?=.*b.*)"




(* let my_re_str = "(?<=.*1111.*)00(?=.*10.*)" *)

let my_re_str' = ".*(?:a*)*(?=.*b.*)"

(* let my_re_str' = ".*1" *)

(* let my_re_str = "1" *)


let my_re = my_re_str |> parse_regex

let my_re' = my_re_str' |> parse_regex




(* let () = my_re |> print_regex |> print_newline *)

(* type char_option_with_end = None | Some of char | End *)

(* type char' = Start | Some of char | End *)


let ans_tape' = eval true my_re' str

let o_matrix = (!Onfa.o_matrix |> Dynarray.to_array)


let answer = time (fun () -> match_onfa true (Option.get !o_regex') str o_matrix)

(* let ans_tape' = match_onfa true (Option.get !o_regex') str o_matrix *)
(* let () = Array.iter (fun x -> x |> print_int; print_string ", ") (ans_tape') |> print_newline *)


(* let onfa = !Onfa.o_regex' |> Option.get |> compile
let state = Onfa.next onfa (StateSet.of_list [0]) '1' [||]
let () = StateSet.is_empty state |> print_bool *)

(* ===================================
let () = Array.iter (fun x -> x |> print_int; print_string ", ") (fst answer) |> print_newline
let () = print_float (snd answer) |> print_newline
=================================== *)








let () = Onfa.o_matrix := (Dynarray.create ())

let ans_tape = eval true my_re str




(* let () = Array.iter (fun x -> x |> print_int; print_string ", ") (ans_tape) |> print_newline *)

(* let () = print_o_regex (Option.get !o_regex') |> print_newline *)

(* let () = print_matrix (Dynarray.to_array !Onfa.o_matrix) *)

(* let () = Dynarray.is_empty !Onfa.o_matrix |> print_bool *)


let o_matrix = if Dynarray.is_empty !Onfa.o_matrix then [|Array.make ((String.length str) + 1) 0|] else (!Onfa.o_matrix |> Dynarray.to_array)

let suffix_tree_with_time = (fun () -> create_suffix_tree str (String.length str) o_matrix) |> time

let suffix_tree = fst suffix_tree_with_time

(* 1万文字で10秒ぐらい *)
(* let () = print_float (snd suffix_tree_with_time) |> print_newline *)


(* let rec count_nodes = function
  | [] -> 0
  | node :: nodes ->
    1 + count_nodes node.Node.children + count_nodes nodes

let () = print_float (time (fun () -> count_nodes suffix_tree) |> snd) *)

let path' = ref 0
let val_list' = ref []
let val_list'' = ref []

let a': float ref = ref 0.0
let b' = ref []

let counter = ref 0

let bfs_trie (root: ('a, 'b) Node.t list) str (o_regex: o_regex) oracle_matrix =
  let queue = Queue.create () in
  let oracle_matrix = if Array.length oracle_matrix = 0 then [|Array.make ((String.length str) + 1) 0|] else oracle_matrix in
  let oracle_matrix' = transpose oracle_matrix in
  let onfa = compile o_regex in
  let i = ref 0 in
  let init_states = initial onfa oracle_matrix'.(!i) in
  let tape = Array.make (String.length str + 1) 0 in
  let init node =
    match node.Node.key with
    | None, init_o_vals ->
      let init_states = initial onfa init_o_vals in
      if not (StateSet.disjoint init_states (onfa.final)) then tape.(0) <- 1 else ();
      let ans = time (fun () -> Queue.push ([], node, init_states) queue) in
      (* print_float (snd ans); *)
      ()
    | _ -> raise (Failure "init")
  in

  List.iter init root;

  let rec aux () =
    if Queue.is_empty queue then
      ()
    else
      (* let () = counter := !counter + 1 in *)

      let (path, current, current_states) = Queue.pop queue in
      let sym = current.Node.key |> fst in
      let o_vals = current.Node.key |> snd in

      let push_children_to_queue () =
        let () =counter := !counter + 1 in
        match sym with
        | None ->
          List.iter (fun child ->
            Queue.push ([], child, current_states) queue
          ) current.Node.children;
        | Some c ->
          let next_states = next onfa current_states c o_vals in
          List.iter (fun child ->
            (* Queue.push (path @ [current.Node.key], child, next_states) queue *)
            Queue.push ([], child, next_states) queue
          ) current.Node.children;
        (* | End -> 
          List.iter (fun child ->
            Queue.push ([], child, current_states) queue
          ) current.Node.children; *)


        (* if sym <> None then
          let next_states = next onfa current_states (Option.get sym) o_vals in
          List.iter (fun child ->
            Queue.push (path @ [current.Node.key], child, next_states) queue
          ) current.Node.children;
        else
          List.iter (fun child ->
            Queue.push ([], child, current_states) queue
          ) current.Node.children; *)
      in

      if StateSet.is_empty current_states then
        aux ()
      else

      if not (StateSet.disjoint current_states (onfa.final)) then
        (* let () = counter := !counter + 1 in *)
        let rec dfs (node: ('a, 'b) Node.t) =
          match node with
            | { key = _; value = Some v; children = [] } -> [v]
            | { key = _; value = None; children = [] } -> []
            | { key = _; value = Some v; children = cs } -> v :: List.concat (List.map dfs cs)
            | { key = _; value = None; children = cs } -> List.concat (List.map dfs cs)
        in
        let value_list, a = time (fun () -> dfs current) in
        let () = b' := a :: !b' in
        (* let () = a' := !a' +. a in *)
        (* List.iter (fun (c, arr) -> print_char (char_of_charoption c);) path; *)
        (* path' := List.length path; *)
        List.iter (fun v -> tape.(v) <- 1) value_list;
        (* val_list' := value_list;
        val_list'' := List.map (fun x -> (x - !path', x)) !val_list' *)
      else
        (* (); *)

      if current.Node.value <> None then
        let () = counter := !counter + 1 in

        (* let () = counter := !counter + 1 in
        let start_pos = Option.get current.Node.value in
        (* print_int start_pos;
        print_newline (); *)
        let str' = String.sub str (start_pos - 1) ((String.length str) - start_pos + 1) in
        (* print_string str';
        print_newline (); *)
        let char_list = List.of_seq (String.to_seq str') in
        let j = ref (start_pos) in
        let rec traverse char_list =
          match char_list with
          | [] -> ()
          | h :: t ->
            let states' = next onfa current_states h oracle_matrix'.(!j) in
            if not (StateSet.disjoint states' (onfa.final)) then
              (
              tape.(!j) <- 1
              )
            else
              j := !j + 1;
              traverse t
        in
        traverse char_list *)
        ()
      else
        (* counter := !counter + 1; *)
        push_children_to_queue ();
        aux ()
        (* (); *)

      (* push_children_to_queue (); *)
      
  in
  aux ();
  tape


let answer = time (fun () -> bfs_trie suffix_tree str (Option.get !o_regex') o_matrix)


(* let () = Dynarray.remove_last !o_matrix *)
(* let answer = bfs_trie suffix_tree str (Option.get !o_regex') o_matrix *)


(* let () = print_newline () *)
(* ====================================== *)
(* let () = Array.iter (fun x -> x |> print_int; print_string ", ") (fst answer) *)
(* ======================================== *)
(* let () = print_newline () *)



(* let () = List.iter (fun x -> print_float (x *. 1000.0); print_string ", ") !b' *)

let sum = List.fold_left (+.) 0.0 !b'

(* let () = print_float (sum) *)

(* let () = print_newline () *)

let () = print_float ((snd answer) -. sum)
let () = print_newline ()

(* let () = print_int (!counter) *)

(* let () = print_float ((snd answer) -. 0.0)
let () = print_newline () *)

(* let () = print_float (snd suffix_tree_with_time) |> print_newline *)



(* let () = print_newline ()
let () = print_int (!counter) *)


(* let () = List.iter (fun (start, end_) -> print_string "("; print_int start; print_string ", "; print_int end_; print_string ")"; print_string ", ") !val_list'' *)


(* let () = print_int (String.length str) |> print_newline *)

(* let () = print_float (!a' *. 1000.0) |> print_newline *)






(* let () = print_int !counter *)




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

(* let o_regex: o_regex = Star (Alt (Char '0', Char '1'))

let () = print (compile o_regex) *)