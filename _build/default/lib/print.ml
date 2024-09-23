open Type;;

let print_query = function
  | Q (sgn, o_name) ->
      print_char 'Q';
      if sgn then print_char '+' else print_char '-';
      print_char '('; print_int o_name; print_char ')'

let print onfa =
  onfa.states |> StateSet.iter (fun x -> x |> print_int; print_string ", ") |> print_newline;
  onfa.alph |> AlphSet.iter (fun x -> x |> print_char) |> print_newline;
  onfa.trans |> List.iter (fun (x:transition) -> print_char '('; print_int x.q; print_char ','; print_char x.sym; print_char ','; print_int x.q'; print_char ')'; print_string ", ") |> print_newline;
  onfa.etrans |> List.iter (fun (x:etransition) -> print_char '('; print_int x.eq; print_char ','; print_int x.eq'; print_char ')'; print_string ", ") |> print_newline;
  onfa.qtrans |> List.iter (fun (x:qtransition) -> print_char '('; print_int x.q; print_char ','; print_query x.qry; print_char ','; print_int x.q'; print_char ')'; print_string ", ") |> print_newline;
  onfa.start |> StateSet.iter (fun x -> x |> print_int; print_string ", ") |> print_newline;
  onfa.final |> StateSet.iter (fun x -> x |> print_int; print_string ", ") |> print_newline

let rec print_o_regex: o_regex -> unit = function
  | Eps -> print_char 'E'
  | Char a -> print_char a
  | Any -> print_char '.'
  | Query (sgn, o_name) -> print_query (Q (sgn, o_name))
  | Alt (a, b) -> print_char '('; print_o_regex a; print_char '|'; print_o_regex b; print_char ')'
  | Seq (a, b) -> print_char '('; print_o_regex a; print_o_regex b; print_char ')'
  | Star a -> print_char '('; print_o_regex a; print_char ')'; print_char '*';
  | Opt a -> print_char '('; print_o_regex a; print_char ')'; print_char '?';
  | Plus a -> print_char '('; print_o_regex a; print_char ')'; print_char '+'

let print_matrix matrix =
  Array.iter (fun x -> Array.iter (fun y -> print_int y; print_string " ") x; print_newline()) matrix