open Regex;;
open Charclasses;;
open Type;;


let parse_raw (str:string) : raw_regex =
  let r:raw_regex = Regex_parser.main Regex_lexer.token (Lexing.from_string str) in
  assert (regex_wf r);
  r

(* let () =Printf.printf "%s\n" (report_raw (parse_raw "a(?=b|c)")) *)

let convert_char (c:character) : Type.regex =
  match c with
  | Char x -> Char x
  | Dot -> Any

let convert_quantifier (q:quantifier) r : Type.regex =
  match q with
  | Star -> Star r
  | Plus -> Plus r

let convert_lookaround (l:lookaround) r : Type.regex =
  match l with
  | Lookahead -> PLA r
  | Lookbehind -> PLB r
  | NegLookahead -> NLA r
  | NegLookbehind -> NLB r

let rec convert_to_my_regex (r:raw_regex) : Type.regex =
  match r with
  | Raw_empty -> Eps
  | Raw_character c -> convert_char c
  | Raw_alt (r1, r2) -> Alt (convert_to_my_regex r1, convert_to_my_regex r2)
  | Raw_con (r1, r2) -> Seq (convert_to_my_regex r1, convert_to_my_regex r2)
  | Raw_quant (q, r) -> convert_quantifier q (convert_to_my_regex r)
  | Raw_lookaround (l, r) -> convert_lookaround l (convert_to_my_regex r)

let parse_regex (str:string) : regex =
  let r:raw_regex = parse_raw str in
  convert_to_my_regex r