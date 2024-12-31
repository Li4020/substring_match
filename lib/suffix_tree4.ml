type edge = {
  start : int;
  end_ : int option;
}

and node = {
  children : (char, (edge * node)) Hashtbl.t;
}

type char_info = char * int array
type data = char_info list

type t = {
  root : node;
  data : data;
}

let create_node () = { children = Hashtbl.create 16 }

let safe_nth lst index =
  try Some (List.nth lst index) with Failure _ -> None

let insert_suffix tree suffix_index =
  let n = List.length tree.data in

  (* 共通部分の長さを計算する補助関数 *)
  let compute_common_length edge i =
    let edge_length =
      match edge.end_ with
      | None -> n - edge.start
      | Some e -> e - edge.start
    in
    let common_length = ref 0 in
    while
      !common_length < edge_length
      && i + !common_length < n
      && safe_nth tree.data (edge.start + !common_length) = safe_nth tree.data (i + !common_length)
    do
      incr common_length
    done;
    !common_length
  in

  (* エッジを分割する補助関数 *)
  let split_edge node c edge next_node common_length i =
    match safe_nth tree.data (edge.start + common_length), safe_nth tree.data (i + common_length) with
    | Some ((_, ch1), _), Some ((_, ch2), _) ->
        let split_edge = { start = edge.start; end_ = Some (edge.start + common_length) } in
        let new_edge = { start = i + common_length; end_ = None } in
        let split_node = create_node () in
        Hashtbl.replace node.children c (split_edge, split_node);
        Hashtbl.add split_node.children ch1 (edge, next_node);
        Hashtbl.add split_node.children ch2 (new_edge, create_node ())
    | _ -> ()
  in

  (* ノードに接尾辞を挿入する補助関数 *)
  let rec insert node i =
    if i >= n then
      () (* 接尾辞の終わり *)
    else
      let prev_char =
        if i = 0 then None
        else match safe_nth tree.data (i - 1) with
             | Some ((_, c), _) -> Some c
             | None -> None
      in
      match safe_nth tree.data i with
      | Some ((_, c), _) ->
          (match Hashtbl.find_opt node.children c with
           | None ->
               let new_edge = { start = i; end_ = None } in
               let new_node = create_node () in
               Hashtbl.add node.children c (new_edge, new_node)
           | Some (edge, next_node) ->
               let common_length = compute_common_length edge i in
               let edge_length =
                 match edge.end_ with
                 | None -> n - edge.start
                 | Some e -> e - edge.start
               in
               if common_length < edge_length then
                 split_edge node c edge next_node common_length i
               else
                 insert next_node (i + edge_length))
      | None -> ()
  in
  insert tree.root suffix_index

(* 接尾辞木をプリントする関数（区間のみ表示） *)
let print_tree_intervals tree =
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
  print_node tree.root ""

(* 接尾辞木をプリントする関数 *)
let print_tree tree =
  let rec get_sublist lst start len =
    let rec aux i acc =
      if i < start then acc
      else match safe_nth lst i with
           | Some item -> aux (i - 1) (item :: acc)
           | None -> acc
    in
    aux (start + len - 1) []
  in

  let rec print_node node indent =
    Hashtbl.iter (fun key (edge, child) ->
      let edge_label =
        match edge.end_ with
        | None -> String.concat "" (List.map (fun ((_, ch), _) -> String.make 1 ch) (get_sublist tree.data edge.start (List.length tree.data - edge.start)))
        | Some e -> String.concat "" (List.map (fun ((_, ch), _) -> String.make 1 ch) (get_sublist tree.data edge.start (e - edge.start)))
      in
      Printf.printf "%s%c -> %s\n" indent key edge_label;
      print_node child (indent ^ "  ")
    ) node.children
  in
  print_node tree.root ""
