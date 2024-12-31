module SuffixTree = struct
  type char_info = char * int array
  type data = char_info list

  type edge = {
    start : int; (* 接尾辞の開始インデックス *)
    end_ : int option; (* None はリストの最後までを表す *)
  }

  type node = {
    children : (char, edge * node) Hashtbl.t;
  }

  type t = {
    root : node;
    data : data; (* 元のデータ *)
  }

  let create_node () = { children = Hashtbl.create 1024 }

  let create_tree data = { root = create_node (); data }

  let insert_suffix tree suffix_index =
    let n = List.length tree.data in
    let rec insert node i =
      if i >= n then
        () (* 接尾辞の終わり *)
      else
        let (c, _) = List.nth tree.data i in
        match Hashtbl.find_opt node.children c with
        | None ->
            let new_edge = { start = i; end_ = None } in
            let new_node = create_node () in
            Hashtbl.add node.children c (new_edge, new_node)
        | Some (edge, next_node) ->
            let edge_length =
              match edge.end_ with
              | None -> n - edge.start
              | Some e -> e - edge.start
            in
            let common_length = ref 0 in
            while
              !common_length < edge_length
              && i + !common_length < n
              && List.nth tree.data (edge.start + !common_length)
                 = List.nth tree.data (i + !common_length)
            do
              incr common_length
            done;
            if !common_length < edge_length then
              let split_edge = { start = edge.start; end_ = Some (edge.start + !common_length) } in
              let new_edge = { start = i + !common_length; end_ = None } in
              let split_node = create_node () in
              Hashtbl.replace node.children c (split_edge, split_node);
              Hashtbl.add split_node.children
                (fst (List.nth tree.data (edge.start + !common_length)))
                (edge, next_node);
              Hashtbl.add split_node.children
                (fst (List.nth tree.data (i + !common_length)))
                (new_edge, create_node ())
            else
              insert next_node (i + edge_length)
    in
    insert tree.root suffix_index

  let build data =
    let tree = create_tree data in
    for i = 0 to List.length data - 1 do
      Printf.printf "%d\n" i;
      insert_suffix tree i
    done;
    tree



  (* let print_tree_intervals tree =
    let rec print_node node indent =
      Hashtbl.iter (fun key (edge, child) ->
        let edge_label =
          match edge.end_ with
          | None -> Printf.sprintf "[%d, *]" edge.start
          | Some e -> Printf.sprintf "[%d, %d]" edge.start e
        in
        Printf.printf "%s%c -> %s\n" indent key edge_label;
        print_node child (indent ^ "  ")
      ) node.children
    in
    print_node tree.root "" *)

  (* let print_tree tree =
    let rec get_sublist lst start len =
      let rec aux i acc =
        if i < start then acc
        else aux (i - 1) (List.nth lst i :: acc)
      in
      aux (start + len - 1) []
    in
  
    let rec print_node node indent =
      Hashtbl.iter (fun key (edge, child) ->
        let edge_label =
          match edge.end_ with
          | None -> String.concat "" (List.map (fun (ch, _) -> String.make 1 ch) (get_sublist tree.data edge.start (List.length tree.data - edge.start)))
          | Some e -> String.concat "" (List.map (fun (ch, _) -> String.make 1 ch) (get_sublist tree.data edge.start (e - edge.start)))
        in
        Printf.printf "%s%c -> %s\n" indent key edge_label;
        print_node child (indent ^ "  ")
      ) node.children
    in
    print_node tree.root "" *)
end








(* let sample_data = [
  ('a', [|1; 2; 3|]);
  ('b', [|4; 5; 6|]);
  ('c', [|7; 8; 9|]);
  ('a', [|10; 11; 12|]);
  ('b', [|13; 14; 15|]);
]

let complex_data = [
  ('x', [|1; 2|]);
  ('y', [|3; 4|]);
  ('z', [|5; 6; 7|]);
  ('x', [|8|]);
  ('y', [|9; 10|]);
  ('z', [|11; 12; 13; 14|]);
  ('x', [|15; 16|]);
  ('a', [|17|]);
  ('b', [|18; 19|]);
  ('c', [|20; 21; 22|]);
]


let () =
  let tree = SuffixTree.build complex_data in
  SuffixTree.print_tree tree;
  print_newline ();
  SuffixTree.print_tree_intervals tree




let create_data (s : string) (matrix : int array array) =
  let n = String.length s in
  if n <> Array.length matrix then
    invalid_arg "The length of the string must match the number of rows in the matrix.";
  let rec aux i acc =
    if i < 0 then acc
    else aux (i - 1) ((s.[i], matrix.(i)) :: acc)
  in
  aux (n - 1) []

let () =
let s = "abcde" in
let matrix = [|
  [|1; 2; 3|];
  [|4; 5; 6|];
  [|7; 8; 9|];
  [|10; 11; 12|];
  [|13; 14; 15|];
|] in
let data = create_data s matrix in
List.iter (fun (c, arr) ->
  Printf.printf "(%c, [%s])\n" c (String.concat "; " (List.map string_of_int (Array.to_list arr)))
) data *)