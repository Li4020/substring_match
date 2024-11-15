
(* The type of tokens. *)

type token = 
  | ZERO
  | UPW
  | UPS
  | UPP
  | UPD
  | UPB
  | STAR
  | RPAR
  | RBRACK
  | RBRAC
  | QMARK
  | PLUS
  | NZDIGIT of (char)
  | MORE
  | MINUS
  | LPAR
  | LOWX
  | LOWW
  | LOWV
  | LOWU
  | LOWT
  | LOWS
  | LOWR
  | LOWP
  | LOWN
  | LOWK
  | LOWF
  | LOWD
  | LOWB
  | LESS
  | LBRACK
  | LBRAC
  | HAT
  | EXCL
  | EQUAL
  | EOF
  | DOT
  | DOLLAR
  | COMMA
  | COLONS
  | CHAR of (char)
  | BACKSL
  | ALT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Regex.raw_regex)
