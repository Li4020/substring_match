open Lib;;
open Suffix_tree;;


module M = Make (struct let get_visible _ = (0,0) end)
open M;;

let rec print_tree st node depth =
  let indent = String.make (depth * 2) ' ' in
  if is_leaf st node then
    Printf.printf "%sLeaf: %s\n" indent (label st node)
  else begin
    Printf.printf "%sNode: %s\n" indent (label st node);
    LSet.iter (fun child -> print_tree st child (depth + 1)) (children st node)
  end
let rec print_tree = function
  | Node (label, max, ext, children) ->
      Printf.printf "Node: %s, Maximal: %d, Ext: %s\n" label max (String.concat ", " (List.map string_of_int ext));
      List.iter print_tree children
  | Leaf (label, (strid, pos)) ->
      Printf.printf "Leaf: %s, StrID: %d, Pos: %d\n" label strid pos

let rec print_tree indent = function
  | Node (label, max, ext, children) ->
      Printf.printf "%sNode: %s, Maximal: %d, Ext: %s\n" indent label max (String.concat ", " (List.map string_of_int ext));
      List.iter (print_tree (indent ^ "  ")) children
  | Leaf (label, (strid, pos)) ->
      Printf.printf "%sLeaf: %s, StrID: %d, Pos: %d\n" indent label strid pos
let st = create ();;
let _ =
  ignore (add st "formal concept analysis");
  (* ignore (add st "logical concept analysis");
  ignore (add st "conceptual graphs"); *)

  print_tree "" (tree st);;
