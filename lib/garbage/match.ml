(* オートマトンの状態を表す型 *)
type state = int

(* オートマトンの遷移関数の型 *)
type transition = state -> char -> state

(* トライノードの型 *)
type trie_node = {
  left: trie_node option;
  right: trie_node option;
  value: string option;
}

(* オートマトンの型 *)
type automaton = {
  transition: transition;
  initial_state: state;
  is_final: state -> bool;
}

(* トライの型 *)
type trie = trie_node

(* オートマトンをトライ上でシミュレートする関数 *)
let rec simulate_automaton automaton trie state =
  match trie with
  | { value = Some v; _ } when automaton.is_final state -> 
      [v]  (* 最終状態に達したら値を返す *)
  | { left = Some l; right = Some r; _ } ->
      let left_results = simulate_automaton automaton l (automaton.transition state '0') in
      let right_results = simulate_automaton automaton r (automaton.transition state '1') in
      left_results @ right_results
  | _ -> []  (* 葉ノードか未定義の遷移の場合 *)

(* メイン検索関数 *)
let search automaton trie =
  simulate_automaton automaton trie automaton.initial_state

(* 文字を2進数に変換する関数 *)
let char_to_binary c =
  let code = Char.code c in
  let rec to_binary n acc =
    if n = 0 then acc
    else to_binary (n / 2) ((string_of_int (n mod 2)) ^ acc)
  in
  let binary = to_binary code "" in
  String.make (8 - String.length binary) '0' ^ binary

(* 文字列を2進数文字列に変換する関数 *)
let string_to_binary s =
  String.concat "" (List.map char_to_binary (List.init (String.length s) (String.get s)))

(* トライ木に文字列を挿入する関数 *)
let rec insert_trie trie s =
  match s with
  | "" -> { trie with value = Some s }
  | _ ->
      let bit = s.[0] in
      if bit = '0' then
        { trie with left = Some (insert_trie (Option.value trie.left ~default:{left=None; right=None; value=None}) (String.sub s 1 (String.length s - 1))) }
      else
        { trie with right = Some (insert_trie (Option.value trie.right ~default:{left=None; right=None; value=None}) (String.sub s 1 (String.length s - 1))) }

(* 文字列リストからトライ木を生成する関数 *)
let create_trie strings =
  (* List.fold_left (fun trie s -> insert_trie trie (string_to_binary s)) {left=None; right=None; value=None} strings *)
  List.fold_left (fun trie s -> insert_trie trie (s)) {left=None; right=None; value=None} strings


(* テスト用のオートマトン *)
let test_automaton = {
  transition = (fun state c ->
    match state, c with
    | 0, '0' -> 0
    | 0, '1' -> 1
    | 1, '0' -> 0
    | 1, '1' -> 1
    | _ -> 2  (* エラー状態 *)
  );
  initial_state = 0;
  is_final = (fun state -> state = 1);
}

(* テスト実行 *)
let () =
  let test_strings = ["1"; "01"; "1111111"; "00"] in
  let test_trie = create_trie test_strings in
  let results = search test_automaton test_trie in
  Printf.printf "Input strings:\n";
  List.iter (Printf.printf "- %s\n") test_strings;
  Printf.printf "\nMatching strings:\n";
  List.iter (Printf.printf "- %s\n") results

(* let () = print_string (string_to_binary "1") *)







(* let loop states =
    let rec loop' j states =
      let next_power_states = next onfa states str.[i] oracle_matrix.(i + d) in
      let jth_value =
        if StateSet.disjoint next_power_states (onfa.final) then
          tape[i] <- 1
        else
          tape[i] <- 0
      in
      if j + d <= str_length - 1 then
        loop' (j + d) next_power_states else
        ()
    in
    loop' 0 states
  in *)