
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | NZDIGIT of (
# 6 "lib/regex_parser.mly"
       (char)
# 27 "lib/regex_parser.ml"
  )
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
    | CHAR of (
# 5 "lib/regex_parser.mly"
       (char)
# 59 "lib/regex_parser.ml"
  )
    | BACKSL
    | ALT
  
end

include MenhirBasics

# 1 "lib/regex_parser.mly"
  
open Regex

# 72 "lib/regex_parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_main) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState012 : (('s, _menhir_box_main) _menhir_cell1_LPAR, _menhir_box_main) _menhir_state
    (** State 012.
        Stack shape : LPAR.
        Start symbol: main. *)

  | MenhirState015 : ((('s, _menhir_box_main) _menhir_cell1_LPAR, _menhir_box_main) _menhir_cell1_QMARK, _menhir_box_main) _menhir_state
    (** State 015.
        Stack shape : LPAR QMARK.
        Start symbol: main. *)

  | MenhirState030 : (('s, _menhir_box_main) _menhir_cell1_LBRACK, _menhir_box_main) _menhir_state
    (** State 030.
        Stack shape : LBRACK.
        Start symbol: main. *)

  | MenhirState060 : ((('s, _menhir_box_main) _menhir_cell1_LBRACK, _menhir_box_main) _menhir_cell1_HAT, _menhir_box_main) _menhir_state
    (** State 060.
        Stack shape : LBRACK HAT.
        Start symbol: main. *)

  | MenhirState069 : (('s, _menhir_box_main) _menhir_cell1_BACKSL, _menhir_box_main) _menhir_state
    (** State 069.
        Stack shape : BACKSL.
        Start symbol: main. *)

  | MenhirState081 : ((('s, _menhir_box_main) _menhir_cell1_BACKSL, _menhir_box_main) _menhir_cell1_NZDIGIT, _menhir_box_main) _menhir_state
    (** State 081.
        Stack shape : BACKSL NZDIGIT.
        Start symbol: main. *)

  | MenhirState082 : (((('s, _menhir_box_main) _menhir_cell1_BACKSL, _menhir_box_main) _menhir_cell1_NZDIGIT, _menhir_box_main) _menhir_cell1_decimaldigits, _menhir_box_main) _menhir_state
    (** State 082.
        Stack shape : BACKSL NZDIGIT decimaldigits.
        Start symbol: main. *)

  | MenhirState127 : (('s, _menhir_box_main) _menhir_cell1_classatom, _menhir_box_main) _menhir_state
    (** State 127.
        Stack shape : classatom.
        Start symbol: main. *)

  | MenhirState128 : ((('s, _menhir_box_main) _menhir_cell1_classatom, _menhir_box_main) _menhir_cell1_MINUS, _menhir_box_main) _menhir_state
    (** State 128.
        Stack shape : classatom MINUS.
        Start symbol: main. *)

  | MenhirState129 : (((('s, _menhir_box_main) _menhir_cell1_classatom, _menhir_box_main) _menhir_cell1_MINUS, _menhir_box_main) _menhir_cell1_classatom, _menhir_box_main) _menhir_state
    (** State 129.
        Stack shape : classatom MINUS classatom.
        Start symbol: main. *)

  | MenhirState132 : (('s, _menhir_box_main) _menhir_cell1_classatomnodash, _menhir_box_main) _menhir_state
    (** State 132.
        Stack shape : classatomnodash.
        Start symbol: main. *)

  | MenhirState133 : ((('s, _menhir_box_main) _menhir_cell1_classatomnodash, _menhir_box_main) _menhir_cell1_MINUS, _menhir_box_main) _menhir_state
    (** State 133.
        Stack shape : classatomnodash MINUS.
        Start symbol: main. *)

  | MenhirState134 : (((('s, _menhir_box_main) _menhir_cell1_classatomnodash, _menhir_box_main) _menhir_cell1_MINUS, _menhir_box_main) _menhir_cell1_classatom, _menhir_box_main) _menhir_state
    (** State 134.
        Stack shape : classatomnodash MINUS classatom.
        Start symbol: main. *)

  | MenhirState149 : (('s, _menhir_box_main) _menhir_cell1_BACKSL, _menhir_box_main) _menhir_state
    (** State 149.
        Stack shape : BACKSL.
        Start symbol: main. *)

  | MenhirState170 : (('s, _menhir_box_main) _menhir_cell1_atom, _menhir_box_main) _menhir_state
    (** State 170.
        Stack shape : atom.
        Start symbol: main. *)

  | MenhirState171 : ((('s, _menhir_box_main) _menhir_cell1_atom, _menhir_box_main) _menhir_cell1_decimaldigits, _menhir_box_main) _menhir_state
    (** State 171.
        Stack shape : atom decimaldigits.
        Start symbol: main. *)

  | MenhirState174 : (((('s, _menhir_box_main) _menhir_cell1_atom, _menhir_box_main) _menhir_cell1_decimaldigits, _menhir_box_main) _menhir_cell1_COMMA, _menhir_box_main) _menhir_state
    (** State 174.
        Stack shape : atom decimaldigits COMMA.
        Start symbol: main. *)

  | MenhirState177 : ((((('s, _menhir_box_main) _menhir_cell1_atom, _menhir_box_main) _menhir_cell1_decimaldigits, _menhir_box_main) _menhir_cell1_COMMA, _menhir_box_main) _menhir_cell1_decimaldigits, _menhir_box_main) _menhir_state
    (** State 177.
        Stack shape : atom decimaldigits COMMA decimaldigits.
        Start symbol: main. *)

  | MenhirState183 : (('s, _menhir_box_main) _menhir_cell1_alternative, _menhir_box_main) _menhir_state
    (** State 183.
        Stack shape : alternative.
        Start symbol: main. *)

  | MenhirState184 : ((('s, _menhir_box_main) _menhir_cell1_alternative, _menhir_box_main) _menhir_cell1_ALT, _menhir_box_main) _menhir_state
    (** State 184.
        Stack shape : alternative ALT.
        Start symbol: main. *)

  | MenhirState187 : ((('s, _menhir_box_main) _menhir_cell1_LPAR, _menhir_box_main) _menhir_cell1_QMARK, _menhir_box_main) _menhir_state
    (** State 187.
        Stack shape : LPAR QMARK.
        Start symbol: main. *)

  | MenhirState190 : ((('s, _menhir_box_main) _menhir_cell1_LPAR, _menhir_box_main) _menhir_cell1_QMARK, _menhir_box_main) _menhir_state
    (** State 190.
        Stack shape : LPAR QMARK.
        Start symbol: main. *)

  | MenhirState193 : ((('s, _menhir_box_main) _menhir_cell1_LPAR, _menhir_box_main) _menhir_cell1_QMARK, _menhir_box_main) _menhir_state
    (** State 193.
        Stack shape : LPAR QMARK.
        Start symbol: main. *)

  | MenhirState196 : ((('s, _menhir_box_main) _menhir_cell1_LPAR, _menhir_box_main) _menhir_cell1_QMARK, _menhir_box_main) _menhir_state
    (** State 196.
        Stack shape : LPAR QMARK.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_alternative = 
  | MenhirCell1_alternative of 's * ('s, 'r) _menhir_state * (Regex.raw_regex)

and ('s, 'r) _menhir_cell1_atom = 
  | MenhirCell1_atom of 's * ('s, 'r) _menhir_state * (Regex.raw_regex)

and ('s, 'r) _menhir_cell1_classatom = 
  | MenhirCell1_classatom of 's * ('s, 'r) _menhir_state * (Charclasses.char_class_elt)

and ('s, 'r) _menhir_cell1_classatomnodash = 
  | MenhirCell1_classatomnodash of 's * ('s, 'r) _menhir_state * (Charclasses.char_class_elt)

and ('s, 'r) _menhir_cell1_decimaldigits = 
  | MenhirCell1_decimaldigits of 's * ('s, 'r) _menhir_state * (string)

and ('s, 'r) _menhir_cell1_ALT = 
  | MenhirCell1_ALT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_BACKSL = 
  | MenhirCell1_BACKSL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_COMMA = 
  | MenhirCell1_COMMA of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_HAT = 
  | MenhirCell1_HAT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LBRACK = 
  | MenhirCell1_LBRACK of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAR = 
  | MenhirCell1_LPAR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NZDIGIT = 
  | MenhirCell1_NZDIGIT of 's * ('s, 'r) _menhir_state * (
# 6 "lib/regex_parser.mly"
       (char)
# 241 "lib/regex_parser.ml"
)

and ('s, 'r) _menhir_cell1_QMARK = 
  | MenhirCell1_QMARK of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Regex.raw_regex) [@@unboxed]

let _menhir_action_001 =
  fun a t ->
    (
# 70 "lib/regex_parser.mly"
                         ( Raw_con(a,t) )
# 255 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_002 =
  fun t ->
    (
# 71 "lib/regex_parser.mly"
           ( t )
# 263 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_003 =
  fun () ->
    (
# 72 "lib/regex_parser.mly"
    ( Raw_empty )
# 271 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_004 =
  fun () ->
    (
# 82 "lib/regex_parser.mly"
        ( Raw_anchor(BeginInput) )
# 279 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_005 =
  fun () ->
    (
# 83 "lib/regex_parser.mly"
           ( Raw_anchor(EndInput) )
# 287 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_006 =
  fun () ->
    (
# 84 "lib/regex_parser.mly"
                ( Raw_anchor(WordBoundary) )
# 295 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_007 =
  fun () ->
    (
# 85 "lib/regex_parser.mly"
               ( Raw_anchor(NonWordBoundary) )
# 303 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_008 =
  fun d ->
    (
# 86 "lib/regex_parser.mly"
                                        ( Raw_lookaround(Lookahead, d) )
# 311 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_009 =
  fun d ->
    (
# 87 "lib/regex_parser.mly"
                                       ( Raw_lookaround(NegLookahead, d) )
# 319 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_010 =
  fun d ->
    (
# 88 "lib/regex_parser.mly"
                                             ( Raw_lookaround(Lookbehind, d) )
# 327 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_011 =
  fun d ->
    (
# 89 "lib/regex_parser.mly"
                                            ( Raw_lookaround(NegLookbehind, d) )
# 335 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_012 =
  fun c ->
    (
# 110 "lib/regex_parser.mly"
                       ( Raw_character(Char c) )
# 343 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_013 =
  fun () ->
    (
# 112 "lib/regex_parser.mly"
        ( Raw_character(Dot) )
# 351 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_014 =
  fun a ->
    (
# 113 "lib/regex_parser.mly"
                        ( a )
# 359 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_015 =
  fun c ->
    (
# 114 "lib/regex_parser.mly"
                     ( Raw_character c )
# 367 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_016 =
  fun d ->
    (
# 115 "lib/regex_parser.mly"
                            ( Raw_capture d )
# 375 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_017 =
  fun d ->
    (
# 117 "lib/regex_parser.mly"
                                         ( d )
# 383 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_018 =
  fun d ->
    (
# 172 "lib/regex_parser.mly"
                    ( raise Regex.Unsupported_backref )
# 391 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_019 =
  fun c ->
    (
# 173 "lib/regex_parser.mly"
                           ( Raw_character(Group c) )
# 399 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_020 =
  fun c ->
    (
# 174 "lib/regex_parser.mly"
                      ( Raw_character(Char c) )
# 407 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_021 =
  fun () ->
    (
# 175 "lib/regex_parser.mly"
         ( raise Regex.Unsupported_named_groups )
# 415 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_022 =
  fun c ->
    (
# 219 "lib/regex_parser.mly"
                                      ( NegClass c )
# 423 "lib/regex_parser.ml"
     : (Regex.character))

let _menhir_action_023 =
  fun c ->
    (
# 220 "lib/regex_parser.mly"
                                  ( Class c )
# 431 "lib/regex_parser.ml"
     : (Regex.character))

let _menhir_action_024 =
  fun () ->
    (
# 209 "lib/regex_parser.mly"
         ( Digit )
# 439 "lib/regex_parser.ml"
     : (Charclasses.char_group))

let _menhir_action_025 =
  fun () ->
    (
# 210 "lib/regex_parser.mly"
        ( NonDigit )
# 447 "lib/regex_parser.ml"
     : (Charclasses.char_group))

let _menhir_action_026 =
  fun () ->
    (
# 211 "lib/regex_parser.mly"
         ( Space )
# 455 "lib/regex_parser.ml"
     : (Charclasses.char_group))

let _menhir_action_027 =
  fun () ->
    (
# 212 "lib/regex_parser.mly"
        ( NonSpace )
# 463 "lib/regex_parser.ml"
     : (Charclasses.char_group))

let _menhir_action_028 =
  fun () ->
    (
# 213 "lib/regex_parser.mly"
         ( Word )
# 471 "lib/regex_parser.ml"
     : (Charclasses.char_group))

let _menhir_action_029 =
  fun () ->
    (
# 214 "lib/regex_parser.mly"
        ( NonWord )
# 479 "lib/regex_parser.ml"
     : (Charclasses.char_group))

let _menhir_action_030 =
  fun () ->
    (
# 215 "lib/regex_parser.mly"
         ( raise Regex.Unsupported_prop )
# 487 "lib/regex_parser.ml"
     : (Charclasses.char_group))

let _menhir_action_031 =
  fun () ->
    (
# 216 "lib/regex_parser.mly"
        ( raise Regex.Unsupported_prop )
# 495 "lib/regex_parser.ml"
     : (Charclasses.char_group))

let _menhir_action_032 =
  fun c ->
    (
# 178 "lib/regex_parser.mly"
                    ( c )
# 503 "lib/regex_parser.ml"
     : (char))

let _menhir_action_033 =
  fun () ->
    (
# 179 "lib/regex_parser.mly"
         ( char_of_int 0 )
# 511 "lib/regex_parser.ml"
     : (char))

let _menhir_action_034 =
  fun () ->
    (
# 181 "lib/regex_parser.mly"
         ( raise Regex.Unsupported_hex )
# 519 "lib/regex_parser.ml"
     : (char))

let _menhir_action_035 =
  fun () ->
    (
# 182 "lib/regex_parser.mly"
         ( raise Regex.Unsupported_unicode )
# 527 "lib/regex_parser.ml"
     : (char))

let _menhir_action_036 =
  fun i ->
    (
# 183 "lib/regex_parser.mly"
                     ( i )
# 535 "lib/regex_parser.ml"
     : (char))

let _menhir_action_037 =
  fun () ->
    (
# 244 "lib/regex_parser.mly"
          ( CChar '-' )
# 543 "lib/regex_parser.ml"
     : (Charclasses.char_class_elt))

let _menhir_action_038 =
  fun c ->
    (
# 245 "lib/regex_parser.mly"
                      ( c )
# 551 "lib/regex_parser.ml"
     : (Charclasses.char_class_elt))

let _menhir_action_039 =
  fun c ->
    (
# 248 "lib/regex_parser.mly"
                         ( c )
# 559 "lib/regex_parser.ml"
     : (Charclasses.char_class_elt))

let _menhir_action_040 =
  fun c ->
    (
# 249 "lib/regex_parser.mly"
                          ( CChar c )
# 567 "lib/regex_parser.ml"
     : (Charclasses.char_class_elt))

let _menhir_action_041 =
  fun () ->
    (
# 253 "lib/regex_parser.mly"
        ( '^' )
# 575 "lib/regex_parser.ml"
     : (char))

let _menhir_action_042 =
  fun () ->
    (
# 254 "lib/regex_parser.mly"
           ( '$' )
# 583 "lib/regex_parser.ml"
     : (char))

let _menhir_action_043 =
  fun () ->
    (
# 255 "lib/regex_parser.mly"
        ( '.' )
# 591 "lib/regex_parser.ml"
     : (char))

let _menhir_action_044 =
  fun () ->
    (
# 256 "lib/regex_parser.mly"
         ( '*' )
# 599 "lib/regex_parser.ml"
     : (char))

let _menhir_action_045 =
  fun () ->
    (
# 257 "lib/regex_parser.mly"
         ( '+' )
# 607 "lib/regex_parser.ml"
     : (char))

let _menhir_action_046 =
  fun () ->
    (
# 258 "lib/regex_parser.mly"
          ( '?' )
# 615 "lib/regex_parser.ml"
     : (char))

let _menhir_action_047 =
  fun () ->
    (
# 259 "lib/regex_parser.mly"
         ( '(' )
# 623 "lib/regex_parser.ml"
     : (char))

let _menhir_action_048 =
  fun () ->
    (
# 260 "lib/regex_parser.mly"
         ( ')' )
# 631 "lib/regex_parser.ml"
     : (char))

let _menhir_action_049 =
  fun () ->
    (
# 261 "lib/regex_parser.mly"
           ( '[' )
# 639 "lib/regex_parser.ml"
     : (char))

let _menhir_action_050 =
  fun () ->
    (
# 262 "lib/regex_parser.mly"
          ( '{' )
# 647 "lib/regex_parser.ml"
     : (char))

let _menhir_action_051 =
  fun () ->
    (
# 263 "lib/regex_parser.mly"
          ( '}' )
# 655 "lib/regex_parser.ml"
     : (char))

let _menhir_action_052 =
  fun () ->
    (
# 264 "lib/regex_parser.mly"
        ( '|' )
# 663 "lib/regex_parser.ml"
     : (char))

let _menhir_action_053 =
  fun c ->
    (
# 265 "lib/regex_parser.mly"
           ( c )
# 671 "lib/regex_parser.ml"
     : (char))

let _menhir_action_054 =
  fun () ->
    (
# 266 "lib/regex_parser.mly"
         ( 'b' )
# 679 "lib/regex_parser.ml"
     : (char))

let _menhir_action_055 =
  fun () ->
    (
# 267 "lib/regex_parser.mly"
        ( 'B' )
# 687 "lib/regex_parser.ml"
     : (char))

let _menhir_action_056 =
  fun () ->
    (
# 268 "lib/regex_parser.mly"
         ( 'd' )
# 695 "lib/regex_parser.ml"
     : (char))

let _menhir_action_057 =
  fun () ->
    (
# 269 "lib/regex_parser.mly"
        ( 'D' )
# 703 "lib/regex_parser.ml"
     : (char))

let _menhir_action_058 =
  fun () ->
    (
# 270 "lib/regex_parser.mly"
         ( 's' )
# 711 "lib/regex_parser.ml"
     : (char))

let _menhir_action_059 =
  fun () ->
    (
# 271 "lib/regex_parser.mly"
        ( 'S' )
# 719 "lib/regex_parser.ml"
     : (char))

let _menhir_action_060 =
  fun () ->
    (
# 272 "lib/regex_parser.mly"
         ( 'w' )
# 727 "lib/regex_parser.ml"
     : (char))

let _menhir_action_061 =
  fun () ->
    (
# 273 "lib/regex_parser.mly"
        ( 'W' )
# 735 "lib/regex_parser.ml"
     : (char))

let _menhir_action_062 =
  fun () ->
    (
# 274 "lib/regex_parser.mly"
         ( 'f' )
# 743 "lib/regex_parser.ml"
     : (char))

let _menhir_action_063 =
  fun () ->
    (
# 275 "lib/regex_parser.mly"
         ( 'n' )
# 751 "lib/regex_parser.ml"
     : (char))

let _menhir_action_064 =
  fun () ->
    (
# 276 "lib/regex_parser.mly"
         ( 'r' )
# 759 "lib/regex_parser.ml"
     : (char))

let _menhir_action_065 =
  fun () ->
    (
# 277 "lib/regex_parser.mly"
         ( 't' )
# 767 "lib/regex_parser.ml"
     : (char))

let _menhir_action_066 =
  fun () ->
    (
# 278 "lib/regex_parser.mly"
         ( 'v' )
# 775 "lib/regex_parser.ml"
     : (char))

let _menhir_action_067 =
  fun () ->
    (
# 279 "lib/regex_parser.mly"
         ( 'k' )
# 783 "lib/regex_parser.ml"
     : (char))

let _menhir_action_068 =
  fun () ->
    (
# 280 "lib/regex_parser.mly"
         ( 'x' )
# 791 "lib/regex_parser.ml"
     : (char))

let _menhir_action_069 =
  fun () ->
    (
# 281 "lib/regex_parser.mly"
         ( 'u' )
# 799 "lib/regex_parser.ml"
     : (char))

let _menhir_action_070 =
  fun () ->
    (
# 282 "lib/regex_parser.mly"
         ( 'p' )
# 807 "lib/regex_parser.ml"
     : (char))

let _menhir_action_071 =
  fun () ->
    (
# 283 "lib/regex_parser.mly"
        ( 'P' )
# 815 "lib/regex_parser.ml"
     : (char))

let _menhir_action_072 =
  fun () ->
    (
# 284 "lib/regex_parser.mly"
          ( ',' )
# 823 "lib/regex_parser.ml"
     : (char))

let _menhir_action_073 =
  fun () ->
    (
# 285 "lib/regex_parser.mly"
           ( ':' )
# 831 "lib/regex_parser.ml"
     : (char))

let _menhir_action_074 =
  fun () ->
    (
# 286 "lib/regex_parser.mly"
         ( '<' )
# 839 "lib/regex_parser.ml"
     : (char))

let _menhir_action_075 =
  fun () ->
    (
# 287 "lib/regex_parser.mly"
         ( '>' )
# 847 "lib/regex_parser.ml"
     : (char))

let _menhir_action_076 =
  fun () ->
    (
# 288 "lib/regex_parser.mly"
          ( '=' )
# 855 "lib/regex_parser.ml"
     : (char))

let _menhir_action_077 =
  fun () ->
    (
# 289 "lib/regex_parser.mly"
         ( '!' )
# 863 "lib/regex_parser.ml"
     : (char))

let _menhir_action_078 =
  fun d ->
    (
# 290 "lib/regex_parser.mly"
                   ( d )
# 871 "lib/regex_parser.ml"
     : (char))

let _menhir_action_079 =
  fun () ->
    (
# 223 "lib/regex_parser.mly"
    ( [] )
# 879 "lib/regex_parser.ml"
     : (Charclasses.char_class))

let _menhir_action_080 =
  fun n ->
    (
# 224 "lib/regex_parser.mly"
                          ( n )
# 887 "lib/regex_parser.ml"
     : (Charclasses.char_class))

let _menhir_action_081 =
  fun () ->
    (
# 293 "lib/regex_parser.mly"
         ( CChar (char_of_int 8) )
# 895 "lib/regex_parser.ml"
     : (Charclasses.char_class_elt))

let _menhir_action_082 =
  fun c ->
    (
# 294 "lib/regex_parser.mly"
                           ( CGroup c )
# 903 "lib/regex_parser.ml"
     : (Charclasses.char_class_elt))

let _menhir_action_083 =
  fun c ->
    (
# 295 "lib/regex_parser.mly"
                       ( CChar c )
# 911 "lib/regex_parser.ml"
     : (Charclasses.char_class_elt))

let _menhir_action_084 =
  fun d ->
    (
# 296 "lib/regex_parser.mly"
                    ( raise Regex.Unsupported_octal )
# 919 "lib/regex_parser.ml"
     : (Charclasses.char_class_elt))

let _menhir_action_085 =
  fun () ->
    (
# 186 "lib/regex_parser.mly"
         ( '\x0C' )
# 927 "lib/regex_parser.ml"
     : (char))

let _menhir_action_086 =
  fun () ->
    (
# 187 "lib/regex_parser.mly"
         ( '\n' )
# 935 "lib/regex_parser.ml"
     : (char))

let _menhir_action_087 =
  fun () ->
    (
# 188 "lib/regex_parser.mly"
         ( '\r' )
# 943 "lib/regex_parser.ml"
     : (char))

let _menhir_action_088 =
  fun () ->
    (
# 189 "lib/regex_parser.mly"
         ( '\t' )
# 951 "lib/regex_parser.ml"
     : (char))

let _menhir_action_089 =
  fun () ->
    (
# 190 "lib/regex_parser.mly"
         ( char_of_int 11 )
# 959 "lib/regex_parser.ml"
     : (char))

let _menhir_action_090 =
  fun d ->
    (
# 102 "lib/regex_parser.mly"
                                ( {min=int_of_string d; max=Some (int_of_string d); greedy=true} )
# 967 "lib/regex_parser.ml"
     : (Regex.counted_quantifier))

let _menhir_action_091 =
  fun d ->
    (
# 103 "lib/regex_parser.mly"
                                     ( {min=int_of_string d; max=Some (int_of_string d); greedy=false} )
# 975 "lib/regex_parser.ml"
     : (Regex.counted_quantifier))

let _menhir_action_092 =
  fun d ->
    (
# 104 "lib/regex_parser.mly"
                                      ( {min=int_of_string d; max=None; greedy=true} )
# 983 "lib/regex_parser.ml"
     : (Regex.counted_quantifier))

let _menhir_action_093 =
  fun d ->
    (
# 105 "lib/regex_parser.mly"
                                            ( {min=int_of_string d; max=None; greedy=false} )
# 991 "lib/regex_parser.ml"
     : (Regex.counted_quantifier))

let _menhir_action_094 =
  fun dmax dmin ->
    (
# 106 "lib/regex_parser.mly"
                                                            ( {min=int_of_string dmin; max=Some (int_of_string dmax); greedy=true} )
# 999 "lib/regex_parser.ml"
     : (Regex.counted_quantifier))

let _menhir_action_095 =
  fun dmax dmin ->
    (
# 107 "lib/regex_parser.mly"
                                                                  ( {min=int_of_string dmin; max=Some (int_of_string dmax); greedy=false} )
# 1007 "lib/regex_parser.ml"
     : (Regex.counted_quantifier))

let _menhir_action_096 =
  fun nz ->
    (
# 50 "lib/regex_parser.mly"
               ( nz )
# 1015 "lib/regex_parser.ml"
     : (char))

let _menhir_action_097 =
  fun () ->
    (
# 51 "lib/regex_parser.mly"
         ( '0' )
# 1023 "lib/regex_parser.ml"
     : (char))

let _menhir_action_098 =
  fun d1 d2 ->
    (
# 54 "lib/regex_parser.mly"
                                     ( d1 ^ String.make 1 d2 )
# 1031 "lib/regex_parser.ml"
     : (string))

let _menhir_action_099 =
  fun d ->
    (
# 55 "lib/regex_parser.mly"
                   ( String.make 1 d )
# 1039 "lib/regex_parser.ml"
     : (string))

let _menhir_action_100 =
  fun d nz ->
    (
# 205 "lib/regex_parser.mly"
                               ( String.make 1 nz ^ d )
# 1047 "lib/regex_parser.ml"
     : (string))

let _menhir_action_101 =
  fun nz ->
    (
# 206 "lib/regex_parser.mly"
               ( String.make 1 nz )
# 1055 "lib/regex_parser.ml"
     : (string))

let _menhir_action_102 =
  fun a ->
    (
# 66 "lib/regex_parser.mly"
                  ( a )
# 1063 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_103 =
  fun a d ->
    (
# 67 "lib/regex_parser.mly"
                                    ( Raw_alt(a,d) )
# 1071 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_104 =
  fun s ->
    (
# 193 "lib/regex_parser.mly"
                      ( s )
# 1079 "lib/regex_parser.ml"
     : (char))

let _menhir_action_105 =
  fun c ->
    (
# 195 "lib/regex_parser.mly"
           ( c )
# 1087 "lib/regex_parser.ml"
     : (char))

let _menhir_action_106 =
  fun () ->
    (
# 196 "lib/regex_parser.mly"
          ( ',' )
# 1095 "lib/regex_parser.ml"
     : (char))

let _menhir_action_107 =
  fun () ->
    (
# 197 "lib/regex_parser.mly"
           ( ':' )
# 1103 "lib/regex_parser.ml"
     : (char))

let _menhir_action_108 =
  fun () ->
    (
# 198 "lib/regex_parser.mly"
         ( '<' )
# 1111 "lib/regex_parser.ml"
     : (char))

let _menhir_action_109 =
  fun () ->
    (
# 199 "lib/regex_parser.mly"
         ( '>' )
# 1119 "lib/regex_parser.ml"
     : (char))

let _menhir_action_110 =
  fun () ->
    (
# 200 "lib/regex_parser.mly"
          ( '=' )
# 1127 "lib/regex_parser.ml"
     : (char))

let _menhir_action_111 =
  fun () ->
    (
# 201 "lib/regex_parser.mly"
          ( '-' )
# 1135 "lib/regex_parser.ml"
     : (char))

let _menhir_action_112 =
  fun () ->
    (
# 202 "lib/regex_parser.mly"
         ( '!' )
# 1143 "lib/regex_parser.ml"
     : (char))

let _menhir_action_113 =
  fun r ->
    (
# 60 "lib/regex_parser.mly"
                    ( r )
# 1151 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_114 =
  fun a ->
    (
# 227 "lib/regex_parser.mly"
                ( [a] )
# 1159 "lib/regex_parser.ml"
     : (Charclasses.char_class))

let _menhir_action_115 =
  fun a n ->
    (
# 228 "lib/regex_parser.mly"
                                            ( a::n )
# 1167 "lib/regex_parser.ml"
     : (Charclasses.char_class))

let _menhir_action_116 =
  fun a1 a2 c ->
    (
# 229 "lib/regex_parser.mly"
                                                    ( (Charclasses.make_range a1 a2) @ c )
# 1175 "lib/regex_parser.ml"
     : (Charclasses.char_class))

let _menhir_action_117 =
  fun a ->
    (
# 232 "lib/regex_parser.mly"
                ( [a] )
# 1183 "lib/regex_parser.ml"
     : (Charclasses.char_class))

let _menhir_action_118 =
  fun a n ->
    (
# 233 "lib/regex_parser.mly"
                                                  ( a::n )
# 1191 "lib/regex_parser.ml"
     : (Charclasses.char_class))

let _menhir_action_119 =
  fun a1 a2 c ->
    (
# 234 "lib/regex_parser.mly"
                                                          ( (Charclasses.make_range a1 a2) @ c )
# 1199 "lib/regex_parser.ml"
     : (Charclasses.char_class))

let _menhir_action_120 =
  fun d ->
    (
# 63 "lib/regex_parser.mly"
                  ( d )
# 1207 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_121 =
  fun c ->
    (
# 136 "lib/regex_parser.mly"
           ( c )
# 1215 "lib/regex_parser.ml"
     : (char))

let _menhir_action_122 =
  fun () ->
    (
# 138 "lib/regex_parser.mly"
         ( 'b' )
# 1223 "lib/regex_parser.ml"
     : (char))

let _menhir_action_123 =
  fun () ->
    (
# 139 "lib/regex_parser.mly"
        ( 'B' )
# 1231 "lib/regex_parser.ml"
     : (char))

let _menhir_action_124 =
  fun () ->
    (
# 140 "lib/regex_parser.mly"
         ( 'd' )
# 1239 "lib/regex_parser.ml"
     : (char))

let _menhir_action_125 =
  fun () ->
    (
# 141 "lib/regex_parser.mly"
        ( 'D' )
# 1247 "lib/regex_parser.ml"
     : (char))

let _menhir_action_126 =
  fun () ->
    (
# 142 "lib/regex_parser.mly"
         ( 's' )
# 1255 "lib/regex_parser.ml"
     : (char))

let _menhir_action_127 =
  fun () ->
    (
# 143 "lib/regex_parser.mly"
        ( 'S' )
# 1263 "lib/regex_parser.ml"
     : (char))

let _menhir_action_128 =
  fun () ->
    (
# 144 "lib/regex_parser.mly"
         ( 'w' )
# 1271 "lib/regex_parser.ml"
     : (char))

let _menhir_action_129 =
  fun () ->
    (
# 145 "lib/regex_parser.mly"
        ( 'W' )
# 1279 "lib/regex_parser.ml"
     : (char))

let _menhir_action_130 =
  fun () ->
    (
# 146 "lib/regex_parser.mly"
         ( 'f' )
# 1287 "lib/regex_parser.ml"
     : (char))

let _menhir_action_131 =
  fun () ->
    (
# 147 "lib/regex_parser.mly"
         ( 'n' )
# 1295 "lib/regex_parser.ml"
     : (char))

let _menhir_action_132 =
  fun () ->
    (
# 148 "lib/regex_parser.mly"
         ( 'r' )
# 1303 "lib/regex_parser.ml"
     : (char))

let _menhir_action_133 =
  fun () ->
    (
# 149 "lib/regex_parser.mly"
         ( 't' )
# 1311 "lib/regex_parser.ml"
     : (char))

let _menhir_action_134 =
  fun () ->
    (
# 150 "lib/regex_parser.mly"
         ( 'v' )
# 1319 "lib/regex_parser.ml"
     : (char))

let _menhir_action_135 =
  fun () ->
    (
# 151 "lib/regex_parser.mly"
         ( 'k' )
# 1327 "lib/regex_parser.ml"
     : (char))

let _menhir_action_136 =
  fun () ->
    (
# 152 "lib/regex_parser.mly"
         ( 'x' )
# 1335 "lib/regex_parser.ml"
     : (char))

let _menhir_action_137 =
  fun () ->
    (
# 153 "lib/regex_parser.mly"
         ( 'u' )
# 1343 "lib/regex_parser.ml"
     : (char))

let _menhir_action_138 =
  fun () ->
    (
# 154 "lib/regex_parser.mly"
         ( 'p' )
# 1351 "lib/regex_parser.ml"
     : (char))

let _menhir_action_139 =
  fun () ->
    (
# 155 "lib/regex_parser.mly"
        ( 'P' )
# 1359 "lib/regex_parser.ml"
     : (char))

let _menhir_action_140 =
  fun () ->
    (
# 156 "lib/regex_parser.mly"
          ( ',' )
# 1367 "lib/regex_parser.ml"
     : (char))

let _menhir_action_141 =
  fun () ->
    (
# 157 "lib/regex_parser.mly"
           ( ':' )
# 1375 "lib/regex_parser.ml"
     : (char))

let _menhir_action_142 =
  fun () ->
    (
# 158 "lib/regex_parser.mly"
         ( '<' )
# 1383 "lib/regex_parser.ml"
     : (char))

let _menhir_action_143 =
  fun () ->
    (
# 159 "lib/regex_parser.mly"
         ( '>' )
# 1391 "lib/regex_parser.ml"
     : (char))

let _menhir_action_144 =
  fun () ->
    (
# 160 "lib/regex_parser.mly"
          ( '=' )
# 1399 "lib/regex_parser.ml"
     : (char))

let _menhir_action_145 =
  fun () ->
    (
# 161 "lib/regex_parser.mly"
          ( '-' )
# 1407 "lib/regex_parser.ml"
     : (char))

let _menhir_action_146 =
  fun () ->
    (
# 162 "lib/regex_parser.mly"
         ( '!' )
# 1415 "lib/regex_parser.ml"
     : (char))

let _menhir_action_147 =
  fun () ->
    (
# 163 "lib/regex_parser.mly"
          ( '{' )
# 1423 "lib/regex_parser.ml"
     : (char))

let _menhir_action_148 =
  fun () ->
    (
# 164 "lib/regex_parser.mly"
          ( '}' )
# 1431 "lib/regex_parser.ml"
     : (char))

let _menhir_action_149 =
  fun () ->
    (
# 166 "lib/regex_parser.mly"
           ( '[' )
# 1439 "lib/regex_parser.ml"
     : (char))

let _menhir_action_150 =
  fun () ->
    (
# 167 "lib/regex_parser.mly"
           ( ']' )
# 1447 "lib/regex_parser.ml"
     : (char))

let _menhir_action_151 =
  fun d ->
    (
# 168 "lib/regex_parser.mly"
                   ( d )
# 1455 "lib/regex_parser.ml"
     : (char))

let _menhir_action_152 =
  fun () ->
    (
# 92 "lib/regex_parser.mly"
         ( Star )
# 1463 "lib/regex_parser.ml"
     : (Regex.quantifier))

let _menhir_action_153 =
  fun () ->
    (
# 93 "lib/regex_parser.mly"
               ( LazyStar )
# 1471 "lib/regex_parser.ml"
     : (Regex.quantifier))

let _menhir_action_154 =
  fun () ->
    (
# 94 "lib/regex_parser.mly"
         ( Plus )
# 1479 "lib/regex_parser.ml"
     : (Regex.quantifier))

let _menhir_action_155 =
  fun () ->
    (
# 95 "lib/regex_parser.mly"
               ( LazyPlus )
# 1487 "lib/regex_parser.ml"
     : (Regex.quantifier))

let _menhir_action_156 =
  fun () ->
    (
# 96 "lib/regex_parser.mly"
          ( QuestionMark )
# 1495 "lib/regex_parser.ml"
     : (Regex.quantifier))

let _menhir_action_157 =
  fun () ->
    (
# 97 "lib/regex_parser.mly"
                ( LazyQuestionMark )
# 1503 "lib/regex_parser.ml"
     : (Regex.quantifier))

let _menhir_action_158 =
  fun () ->
    (
# 120 "lib/regex_parser.mly"
        ( '^' )
# 1511 "lib/regex_parser.ml"
     : (char))

let _menhir_action_159 =
  fun () ->
    (
# 121 "lib/regex_parser.mly"
           ( '$' )
# 1519 "lib/regex_parser.ml"
     : (char))

let _menhir_action_160 =
  fun () ->
    (
# 122 "lib/regex_parser.mly"
           ( '\\' )
# 1527 "lib/regex_parser.ml"
     : (char))

let _menhir_action_161 =
  fun () ->
    (
# 123 "lib/regex_parser.mly"
        ( '.' )
# 1535 "lib/regex_parser.ml"
     : (char))

let _menhir_action_162 =
  fun () ->
    (
# 124 "lib/regex_parser.mly"
         ( '*' )
# 1543 "lib/regex_parser.ml"
     : (char))

let _menhir_action_163 =
  fun () ->
    (
# 125 "lib/regex_parser.mly"
         ( '+' )
# 1551 "lib/regex_parser.ml"
     : (char))

let _menhir_action_164 =
  fun () ->
    (
# 126 "lib/regex_parser.mly"
          ( '?' )
# 1559 "lib/regex_parser.ml"
     : (char))

let _menhir_action_165 =
  fun () ->
    (
# 127 "lib/regex_parser.mly"
         ( '(' )
# 1567 "lib/regex_parser.ml"
     : (char))

let _menhir_action_166 =
  fun () ->
    (
# 128 "lib/regex_parser.mly"
         ( ')' )
# 1575 "lib/regex_parser.ml"
     : (char))

let _menhir_action_167 =
  fun () ->
    (
# 129 "lib/regex_parser.mly"
           ( '[' )
# 1583 "lib/regex_parser.ml"
     : (char))

let _menhir_action_168 =
  fun () ->
    (
# 130 "lib/regex_parser.mly"
           ( ']' )
# 1591 "lib/regex_parser.ml"
     : (char))

let _menhir_action_169 =
  fun () ->
    (
# 131 "lib/regex_parser.mly"
          ( '{' )
# 1599 "lib/regex_parser.ml"
     : (char))

let _menhir_action_170 =
  fun () ->
    (
# 132 "lib/regex_parser.mly"
          ( '}' )
# 1607 "lib/regex_parser.ml"
     : (char))

let _menhir_action_171 =
  fun () ->
    (
# 133 "lib/regex_parser.mly"
        ( '|' )
# 1615 "lib/regex_parser.ml"
     : (char))

let _menhir_action_172 =
  fun a ->
    (
# 75 "lib/regex_parser.mly"
                ( a )
# 1623 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_173 =
  fun a ->
    (
# 76 "lib/regex_parser.mly"
           ( a )
# 1631 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_174 =
  fun a q ->
    (
# 77 "lib/regex_parser.mly"
                        ( Raw_quant(q,a) )
# 1639 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_action_175 =
  fun a cq ->
    (
# 78 "lib/regex_parser.mly"
                                 ( Raw_count(cq,a) )
# 1647 "lib/regex_parser.ml"
     : (Regex.raw_regex))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ALT ->
        "ALT"
    | BACKSL ->
        "BACKSL"
    | CHAR _ ->
        "CHAR"
    | COLONS ->
        "COLONS"
    | COMMA ->
        "COMMA"
    | DOLLAR ->
        "DOLLAR"
    | DOT ->
        "DOT"
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | EXCL ->
        "EXCL"
    | HAT ->
        "HAT"
    | LBRAC ->
        "LBRAC"
    | LBRACK ->
        "LBRACK"
    | LESS ->
        "LESS"
    | LOWB ->
        "LOWB"
    | LOWD ->
        "LOWD"
    | LOWF ->
        "LOWF"
    | LOWK ->
        "LOWK"
    | LOWN ->
        "LOWN"
    | LOWP ->
        "LOWP"
    | LOWR ->
        "LOWR"
    | LOWS ->
        "LOWS"
    | LOWT ->
        "LOWT"
    | LOWU ->
        "LOWU"
    | LOWV ->
        "LOWV"
    | LOWW ->
        "LOWW"
    | LOWX ->
        "LOWX"
    | LPAR ->
        "LPAR"
    | MINUS ->
        "MINUS"
    | MORE ->
        "MORE"
    | NZDIGIT _ ->
        "NZDIGIT"
    | PLUS ->
        "PLUS"
    | QMARK ->
        "QMARK"
    | RBRAC ->
        "RBRAC"
    | RBRACK ->
        "RBRACK"
    | RPAR ->
        "RPAR"
    | STAR ->
        "STAR"
    | UPB ->
        "UPB"
    | UPD ->
        "UPD"
    | UPP ->
        "UPP"
    | UPS ->
        "UPS"
    | UPW ->
        "UPW"
    | ZERO ->
        "ZERO"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_204 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      let d = _v in
      let _v = _menhir_action_120 d in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let r = _v in
          let _v = _menhir_action_113 r in
          MenhirBox_main _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_097 () in
      _menhir_goto_decimaldigit _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_decimaldigit : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState000 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState012 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState196 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState193 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState190 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState187 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState183 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState184 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState030 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState132 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState134 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState133 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState127 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState129 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState128 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState060 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState170 ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState171 ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState177 ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState082 ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_161 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let d = _v in
      let _v = _menhir_action_151 d in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_patterncharacter : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let c = _v in
      let _v = _menhir_action_012 c in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_atom : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | QMARK ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_153 () in
              _menhir_goto_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALT | BACKSL | CHAR _ | COLONS | COMMA | DOLLAR | DOT | EOF | EQUAL | EXCL | HAT | LBRAC | LBRACK | LESS | LOWB | LOWD | LOWF | LOWK | LOWN | LOWP | LOWR | LOWS | LOWT | LOWU | LOWV | LOWW | LOWX | LPAR | MINUS | MORE | NZDIGIT _ | RBRAC | RBRACK | RPAR | UPB | UPD | UPP | UPS | UPW | ZERO ->
              let _v = _menhir_action_152 () in
              _menhir_goto_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | QMARK ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | QMARK ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_157 () in
              _menhir_goto_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALT | BACKSL | CHAR _ | COLONS | COMMA | DOLLAR | DOT | EOF | EQUAL | EXCL | HAT | LBRAC | LBRACK | LESS | LOWB | LOWD | LOWF | LOWK | LOWN | LOWP | LOWR | LOWS | LOWT | LOWU | LOWV | LOWW | LOWX | LPAR | MINUS | MORE | NZDIGIT _ | RBRAC | RBRACK | RPAR | UPB | UPD | UPP | UPS | UPW | ZERO ->
              let _v = _menhir_action_156 () in
              _menhir_goto_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | PLUS ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | QMARK ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_155 () in
              _menhir_goto_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALT | BACKSL | CHAR _ | COLONS | COMMA | DOLLAR | DOT | EOF | EQUAL | EXCL | HAT | LBRAC | LBRACK | LESS | LOWB | LOWD | LOWF | LOWK | LOWN | LOWP | LOWR | LOWS | LOWT | LOWU | LOWV | LOWW | LOWX | LPAR | MINUS | MORE | NZDIGIT _ | RBRAC | RBRACK | RPAR | UPB | UPD | UPP | UPS | UPW | ZERO ->
              let _v = _menhir_action_154 () in
              _menhir_goto_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | LBRAC ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState170 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NZDIGIT _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ALT | BACKSL | CHAR _ | COLONS | COMMA | DOLLAR | DOT | EOF | EQUAL | EXCL | HAT | LBRACK | LESS | LOWB | LOWD | LOWF | LOWK | LOWN | LOWP | LOWR | LOWS | LOWT | LOWU | LOWV | LOWW | LOWX | LPAR | MINUS | MORE | NZDIGIT _ | RBRAC | RBRACK | RPAR | UPB | UPD | UPP | UPS | UPW | ZERO ->
          let a = _v in
          let _v = _menhir_action_173 a in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_quantifier : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_atom -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_atom (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let q = _v in
      let _v = _menhir_action_174 a q in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_term : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState183 ->
          _menhir_run_186 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState000 ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState012 ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState196 ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState193 ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState190 ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState187 ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState184 ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_186 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_alternative -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_alternative (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_001 a t in
      _menhir_goto_alternative _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_alternative : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | UPW ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | UPS ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | UPP ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | UPD ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | UPB ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | RBRACK ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | RBRAC ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | NZDIGIT _v_0 ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState183
      | MORE ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | MINUS ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LPAR ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWX ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWW ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWV ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWU ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWT ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWS ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWR ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWP ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWN ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWK ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWF ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWD ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LOWB ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LESS ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LBRACK ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | LBRAC ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | HAT ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | EXCL ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | EQUAL ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | DOT ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | DOLLAR ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | COMMA ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | COLONS ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | CHAR _v_1 ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState183
      | BACKSL ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | ALT ->
          let _menhir_stack = MenhirCell1_alternative (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_ALT (_menhir_stack, MenhirState183) in
          let _menhir_s = MenhirState184 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | UPW ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | UPS ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | UPP ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | UPD ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | UPB ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RBRACK ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RBRAC ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NZDIGIT _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | MORE ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWX ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWW ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWV ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWU ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWT ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWS ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWR ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWP ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWN ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWK ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWF ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWD ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LOWB ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LESS ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACK ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | HAT ->
              _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCL ->
              _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EQUAL ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DOT ->
              _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DOLLAR ->
              _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | COMMA ->
              _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | COLONS ->
              _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHAR _v ->
              _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BACKSL ->
              _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ALT | EOF | RPAR ->
              _menhir_reduce_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
          | _ ->
              _eRR ())
      | EOF | RPAR ->
          let a = _v in
          let _v = _menhir_action_102 a in
          _menhir_goto_disjunction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_129 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_003 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_127 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_139 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_005 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_125 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_006 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_123 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_007 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_150 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_008 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_148 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_009 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let nz = _v in
      let _v = _menhir_action_096 nz in
      _menhir_goto_decimaldigit _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_010 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_143 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_011 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_145 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_012 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState012 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UPW ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UPS ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UPP ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UPD ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UPB ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RBRACK ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RBRAC ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | QMARK ->
          let _menhir_stack = MenhirCell1_QMARK (_menhir_stack, _menhir_s) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LESS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | EXCL ->
                  let _menhir_s = MenhirState015 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | ZERO ->
                      _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | UPW ->
                      _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | UPS ->
                      _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | UPP ->
                      _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | UPD ->
                      _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | UPB ->
                      _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RBRACK ->
                      _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RBRAC ->
                      _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | NZDIGIT _v ->
                      _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | MORE ->
                      _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | MINUS ->
                      _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LPAR ->
                      _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWX ->
                      _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWW ->
                      _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWV ->
                      _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWU ->
                      _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWT ->
                      _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWS ->
                      _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWR ->
                      _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWP ->
                      _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWN ->
                      _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWK ->
                      _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWF ->
                      _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWD ->
                      _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWB ->
                      _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LESS ->
                      _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LBRACK ->
                      _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LBRAC ->
                      _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | HAT ->
                      _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EXCL ->
                      _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EQUAL ->
                      _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | DOT ->
                      _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | DOLLAR ->
                      _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | COMMA ->
                      _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | COLONS ->
                      _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | CHAR _v ->
                      _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | BACKSL ->
                      _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ALT | RPAR ->
                      _menhir_reduce_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
                  | _ ->
                      _eRR ())
              | EQUAL ->
                  let _menhir_s = MenhirState187 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | ZERO ->
                      _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | UPW ->
                      _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | UPS ->
                      _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | UPP ->
                      _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | UPD ->
                      _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | UPB ->
                      _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RBRACK ->
                      _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RBRAC ->
                      _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | NZDIGIT _v ->
                      _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | MORE ->
                      _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | MINUS ->
                      _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LPAR ->
                      _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWX ->
                      _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWW ->
                      _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWV ->
                      _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWU ->
                      _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWT ->
                      _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWS ->
                      _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWR ->
                      _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWP ->
                      _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWN ->
                      _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWK ->
                      _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWF ->
                      _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWD ->
                      _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LOWB ->
                      _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LESS ->
                      _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LBRACK ->
                      _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LBRAC ->
                      _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | HAT ->
                      _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EXCL ->
                      _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EQUAL ->
                      _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | DOT ->
                      _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | DOLLAR ->
                      _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | COMMA ->
                      _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | COLONS ->
                      _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | CHAR _v ->
                      _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | BACKSL ->
                      _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ALT | RPAR ->
                      _menhir_reduce_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | EXCL ->
              let _menhir_s = MenhirState190 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ZERO ->
                  _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPW ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPS ->
                  _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPP ->
                  _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPD ->
                  _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPB ->
                  _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | RBRACK ->
                  _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | RBRAC ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NZDIGIT _v ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | MORE ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MINUS ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWX ->
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWW ->
                  _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWV ->
                  _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWU ->
                  _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWT ->
                  _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWS ->
                  _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWR ->
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWP ->
                  _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWN ->
                  _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWK ->
                  _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWF ->
                  _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWD ->
                  _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWB ->
                  _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LESS ->
                  _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRACK ->
                  _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRAC ->
                  _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | HAT ->
                  _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EXCL ->
                  _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EQUAL ->
                  _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | DOT ->
                  _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | DOLLAR ->
                  _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | COMMA ->
                  _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | COLONS ->
                  _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | CHAR _v ->
                  _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | BACKSL ->
                  _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ALT | RPAR ->
                  _menhir_reduce_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
              | _ ->
                  _eRR ())
          | EQUAL ->
              let _menhir_s = MenhirState193 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ZERO ->
                  _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPW ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPS ->
                  _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPP ->
                  _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPD ->
                  _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPB ->
                  _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | RBRACK ->
                  _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | RBRAC ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NZDIGIT _v ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | MORE ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MINUS ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWX ->
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWW ->
                  _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWV ->
                  _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWU ->
                  _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWT ->
                  _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWS ->
                  _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWR ->
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWP ->
                  _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWN ->
                  _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWK ->
                  _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWF ->
                  _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWD ->
                  _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWB ->
                  _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LESS ->
                  _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRACK ->
                  _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRAC ->
                  _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | HAT ->
                  _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EXCL ->
                  _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EQUAL ->
                  _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | DOT ->
                  _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | DOLLAR ->
                  _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | COMMA ->
                  _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | COLONS ->
                  _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | CHAR _v ->
                  _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | BACKSL ->
                  _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ALT | RPAR ->
                  _menhir_reduce_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
              | _ ->
                  _eRR ())
          | COLONS ->
              let _menhir_s = MenhirState196 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ZERO ->
                  _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPW ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPS ->
                  _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPP ->
                  _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPD ->
                  _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UPB ->
                  _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | RBRACK ->
                  _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | RBRAC ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NZDIGIT _v ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | MORE ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MINUS ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWX ->
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWW ->
                  _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWV ->
                  _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWU ->
                  _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWT ->
                  _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWS ->
                  _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWR ->
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWP ->
                  _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWN ->
                  _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWK ->
                  _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWF ->
                  _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWD ->
                  _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LOWB ->
                  _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LESS ->
                  _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRACK ->
                  _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRAC ->
                  _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | HAT ->
                  _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EXCL ->
                  _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EQUAL ->
                  _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | DOT ->
                  _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | DOLLAR ->
                  _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | COMMA ->
                  _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | COLONS ->
                  _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | CHAR _v ->
                  _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | BACKSL ->
                  _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ALT | RPAR ->
                  _menhir_reduce_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | NZDIGIT _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MORE ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWX ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWW ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWV ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWU ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWT ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWS ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWR ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWP ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWK ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWF ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWD ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWB ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LESS ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACK ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRAC ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | HAT ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCL ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EQUAL ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DOT ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DOLLAR ->
          _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COMMA ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COLONS ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHAR _v ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BACKSL ->
          _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ALT | RPAR ->
          _menhir_reduce_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_016 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_136 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_017 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_128 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_018 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_134 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_019 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_137 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_020 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_133 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_021 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_126 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_022 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_132 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_023 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_138 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_024 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_131 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_025 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_135 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_026 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_130 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_027 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_124 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_028 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_122 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_029 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_142 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_030 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | UPW ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | UPS ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | UPP ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | UPD ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | UPB ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | STAR ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | RPAR ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | RBRAC ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | QMARK ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | PLUS ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | NZDIGIT _v ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030
      | MORE ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | MINUS ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LPAR ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWX ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWW ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWV ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWU ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWT ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWS ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWR ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWP ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWN ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWK ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWF ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWD ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LOWB ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LESS ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LBRACK ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | LBRAC ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | HAT ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          let _menhir_stack = MenhirCell1_HAT (_menhir_stack, MenhirState030) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | UPW ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | UPS ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | UPP ->
              _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | UPD ->
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | UPB ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | STAR ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | RPAR ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | RBRAC ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | QMARK ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | PLUS ->
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | NZDIGIT _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState060
          | MORE ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | MINUS ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LPAR ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWX ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWW ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWV ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWU ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWT ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWS ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWR ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWP ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWN ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWK ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWF ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWD ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LOWB ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LESS ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LBRACK ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | LBRAC ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | HAT ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | EXCL ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | EQUAL ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | DOT ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | DOLLAR ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | COMMA ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | COLONS ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | CHAR _v ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState060
          | BACKSL ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | ALT ->
              _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
          | RBRACK ->
              let _v = _menhir_action_079 () in
              _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | EXCL ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | EQUAL ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | DOT ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | DOLLAR ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | COMMA ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | COLONS ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | CHAR _v ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030
      | BACKSL ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | ALT ->
          let _menhir_stack = MenhirCell1_LBRACK (_menhir_stack, _menhir_s) in
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | EOF | RBRACK ->
          let _v = _menhir_action_149 () in
          _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_031 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_061 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_classatomnodashchar : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let c = _v in
      let _v = _menhir_action_040 c in
      _menhir_goto_classatomnodash _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_classatomnodash : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState132 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState127 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState030 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState134 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState133 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState129 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState128 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState060 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_132 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | UPW ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | UPS ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | UPP ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | UPD ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | UPB ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | STAR ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | RPAR ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | RBRAC ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | QMARK ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | PLUS ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | NZDIGIT _v_0 ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState132
      | MORE ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | MINUS ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | UPW ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | UPS ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | UPP ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | UPD ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | UPB ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | STAR ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | RPAR ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | RBRAC ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | QMARK ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | PLUS ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | NZDIGIT _v_1 ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState133
          | MORE ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | MINUS ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LPAR ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWX ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWW ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWV ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWU ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWT ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWS ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWR ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWP ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWN ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWK ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWF ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWD ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LOWB ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LESS ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LBRACK ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | LBRAC ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | HAT ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | EXCL ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | EQUAL ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | DOT ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | DOLLAR ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | COMMA ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | COLONS ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | CHAR _v_2 ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState133
          | BACKSL ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | ALT ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState132) in
              _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
          | RBRACK ->
              let _v_3 = _menhir_action_037 () in
              _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState132 _tok
          | _ ->
              _eRR ())
      | LPAR ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWX ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWW ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWV ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWU ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWT ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWS ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWR ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWP ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWN ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWK ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWF ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWD ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LOWB ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LESS ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LBRACK ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | LBRAC ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | HAT ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | EXCL ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | EQUAL ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | DOT ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | DOLLAR ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | COMMA ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | COLONS ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | CHAR _v_4 ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState132
      | BACKSL ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | ALT ->
          let _menhir_stack = MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, _v) in
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | RBRACK ->
          let c = _v in
          let _v = _menhir_action_038 c in
          _menhir_goto_classatom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_032 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_059 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_033 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_071 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_034 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_057 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_035 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_055 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_036 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_044 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_037 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_048 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_038 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_051 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_039 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_046 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_040 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_045 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_041 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_075 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_042 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_037 () in
      _menhir_goto_classatom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_classatom : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState127 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState132 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState133 ->
          _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState128 ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState030 ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState134 ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState129 ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState060 ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_137 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let a = _v in
      let _v = _menhir_action_117 a in
      _menhir_goto_nonemptyclassrangesnodash _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_nonemptyclassrangesnodash : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState132 ->
          _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState127 ->
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_136 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_classatomnodash -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let n = _v in
      let _v = _menhir_action_118 a n in
      _menhir_goto_nonemptyclassrangesnodash _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_131 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_classatom -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_classatom (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let n = _v in
      let _v = _menhir_action_115 a n in
      _menhir_goto_nonemptyclassranges _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_nonemptyclassranges : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let n = _v in
      let _v = _menhir_action_080 n in
      _menhir_goto_classcontents _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_classcontents : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState030 ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState134 ->
          _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState129 ->
          _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState060 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_138 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LBRACK -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACK ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LBRACK (_menhir_stack, _menhir_s) = _menhir_stack in
          let c = _v in
          let _v = _menhir_action_023 c in
          _menhir_goto_characterclass _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_characterclass : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let c = _v in
      let _v = _menhir_action_015 c in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_135 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_classatomnodash, _menhir_box_main) _menhir_cell1_MINUS, _menhir_box_main) _menhir_cell1_classatom -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_classatom (_menhir_stack, _, a2) = _menhir_stack in
      let MenhirCell1_MINUS (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_classatomnodash (_menhir_stack, _menhir_s, a1) = _menhir_stack in
      let c = _v in
      let _v = _menhir_action_119 a1 a2 c in
      _menhir_goto_nonemptyclassrangesnodash _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_130 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_classatom, _menhir_box_main) _menhir_cell1_MINUS, _menhir_box_main) _menhir_cell1_classatom -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_classatom (_menhir_stack, _, a2) = _menhir_stack in
      let MenhirCell1_MINUS (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_classatom (_menhir_stack, _menhir_s, a1) = _menhir_stack in
      let c = _v in
      let _v = _menhir_action_116 a1 a2 c in
      _menhir_goto_nonemptyclassranges _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_123 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACK, _menhir_box_main) _menhir_cell1_HAT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACK ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_HAT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LBRACK (_menhir_stack, _menhir_s) = _menhir_stack in
          let c = _v in
          let _v = _menhir_action_022 c in
          _menhir_goto_characterclass _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_134 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_classatomnodash, _menhir_box_main) _menhir_cell1_MINUS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | UPW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | UPS ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | UPP ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | UPD ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | UPB ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | STAR ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | RPAR ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | RBRAC ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | QMARK ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | PLUS ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | NZDIGIT _v_0 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState134
      | MORE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | MINUS ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LPAR ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWX ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWW ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWV ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWU ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWT ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWS ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWP ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWN ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWK ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWF ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWD ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LOWB ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LESS ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LBRACK ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LBRAC ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | HAT ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | EXCL ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | EQUAL ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | DOT ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | DOLLAR ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | COMMA ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | COLONS ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | CHAR _v_1 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState134
      | BACKSL ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | ALT ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | RBRACK ->
          let _v_2 = _menhir_action_079 () in
          _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_043 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_047 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_044 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_068 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_045 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_060 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_046 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_066 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_047 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_069 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_048 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_065 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_049 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_058 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_050 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_064 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_051 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_070 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_052 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_063 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_053 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_067 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_054 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_062 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_055 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_056 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_056 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_054 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_057 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_074 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_058 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_049 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_059 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_050 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_061 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_041 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_062 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_077 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_063 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_076 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_064 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_043 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_065 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_042 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_066 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_072 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_067 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_073 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_068 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let c = _v in
      let _v = _menhir_action_053 c in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_069 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | UPW ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | UPS ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | UPP ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | UPD ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | STAR ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | RPAR ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | RBRACK ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | RBRAC ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | QMARK ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | PLUS ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | NZDIGIT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState069
      | MORE ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | MINUS ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LPAR ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOWX ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOWW ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOWV ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOWU ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOWT ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOWS ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOWR ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOWP ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOWN ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOWF ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOWD ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LOWB ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_081 () in
          _menhir_goto_classescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LESS ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LBRACK ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | LBRAC ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | HAT ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | EXCL ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | EQUAL ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | DOT ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | DOLLAR ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | COMMA ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | COLONS ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | CHAR _v ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState069
      | BACKSL ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | ALT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_033 () in
      _menhir_goto_characterescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_characterescape : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState149 ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState069 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_154 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let c = _v in
      let _v = _menhir_action_020 c in
      _menhir_goto_atomescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_atomescape : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_BACKSL (_menhir_stack, _menhir_s) = _menhir_stack in
      let a = _v in
      let _v = _menhir_action_014 a in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_118 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let c = _v in
      let _v = _menhir_action_083 c in
      _menhir_goto_classescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_classescape : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_BACKSL (_menhir_stack, _menhir_s) = _menhir_stack in
      let c = _v in
      let _v = _menhir_action_039 c in
      _menhir_goto_classatomnodash _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_071 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_029 () in
      _menhir_goto_characterclassescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_characterclassescape : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState149 ->
          _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState069 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_155 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let c = _v in
      let _v = _menhir_action_019 c in
      _menhir_goto_atomescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_119 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let c = _v in
      let _v = _menhir_action_082 c in
      _menhir_goto_classescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_072 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_027 () in
      _menhir_goto_characterclassescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_073 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_031 () in
      _menhir_goto_characterclassescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_074 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_025 () in
      _menhir_goto_characterclassescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_075 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_162 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_syntaxcharacter : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let s = _v in
      let _v = _menhir_action_104 s in
      _menhir_goto_identityescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_identityescape : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let i = _v in
      let _v = _menhir_action_036 i in
      _menhir_goto_characterescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_076 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_166 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_077 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_168 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_078 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_170 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_079 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_164 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_080 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_163 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_081 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_NZDIGIT (_menhir_stack, _menhir_s, _v) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | NZDIGIT _v_0 ->
          let _menhir_stack = MenhirCell1_NZDIGIT (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState081
      | ALT | BACKSL | CHAR _ | COLONS | COMMA | DOLLAR | DOT | EOF | EQUAL | EXCL | HAT | LBRAC | LBRACK | LESS | LOWB | LOWD | LOWF | LOWK | LOWN | LOWP | LOWR | LOWS | LOWT | LOWU | LOWV | LOWW | LOWX | LPAR | MINUS | MORE | PLUS | QMARK | RBRAC | RBRACK | RPAR | STAR | UPB | UPD | UPP | UPS | UPW ->
          let nz = _v in
          let _v = _menhir_action_101 nz in
          _menhir_goto_decimalescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_decimalescape : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState149 ->
          _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState069 ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_153 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let d = _v in
      let _v = _menhir_action_018 d in
      _menhir_goto_atomescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_115 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let d = _v in
      let _v = _menhir_action_084 d in
      _menhir_goto_classescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_085 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_109 () in
      _menhir_goto_identityescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_086 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_111 () in
      _menhir_goto_identityescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_087 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_165 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_088 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_034 () in
      _menhir_goto_characterescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_089 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_028 () in
      _menhir_goto_characterclassescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_090 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_089 () in
      _menhir_goto_controlescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_controlescape : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let c = _v in
      let _v = _menhir_action_032 c in
      _menhir_goto_characterescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_091 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_035 () in
      _menhir_goto_characterescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_092 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_088 () in
      _menhir_goto_controlescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_093 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_026 () in
      _menhir_goto_characterclassescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_094 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_087 () in
      _menhir_goto_controlescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_095 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_030 () in
      _menhir_goto_characterclassescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_096 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_086 () in
      _menhir_goto_controlescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_097 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_085 () in
      _menhir_goto_controlescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_098 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_024 () in
      _menhir_goto_characterclassescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_100 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_108 () in
      _menhir_goto_identityescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_101 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_167 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_102 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_169 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_103 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_158 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_104 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_112 () in
      _menhir_goto_identityescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_105 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_110 () in
      _menhir_goto_identityescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_106 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_161 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_107 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_159 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_108 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_106 () in
      _menhir_goto_identityescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_109 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_107 () in
      _menhir_goto_identityescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_110 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let c = _v in
      let _v = _menhir_action_105 c in
      _menhir_goto_identityescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_111 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_160 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_112 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_171 () in
      _menhir_goto_syntaxcharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_120 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_052 () in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_129 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_classatom, _menhir_box_main) _menhir_cell1_MINUS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | UPW ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | UPS ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | UPP ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | UPD ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | UPB ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | STAR ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | RPAR ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | RBRAC ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | QMARK ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | PLUS ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | NZDIGIT _v_0 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState129
      | MORE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | MINUS ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LPAR ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWX ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWW ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWV ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWU ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWT ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWS ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWP ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWN ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWK ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWF ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWD ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LOWB ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LESS ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LBRACK ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | LBRAC ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | HAT ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | EXCL ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | EQUAL ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | DOT ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | DOLLAR ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | COMMA ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | COLONS ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | CHAR _v_1 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState129
      | BACKSL ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | ALT ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | RBRACK ->
          let _v_2 = _menhir_action_079 () in
          _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_127 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | UPW ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | UPS ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | UPP ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | UPD ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | UPB ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | STAR ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | RPAR ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | RBRAC ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | QMARK ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | PLUS ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | NZDIGIT _v_0 ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState127
      | MORE ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | MINUS ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | UPW ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | UPS ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | UPP ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | UPD ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | UPB ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | STAR ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | RPAR ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | RBRAC ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | QMARK ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | PLUS ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | NZDIGIT _v_1 ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState128
          | MORE ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | MINUS ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LPAR ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWX ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWW ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWV ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWU ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWT ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWS ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWR ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWP ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWN ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWK ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWF ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWD ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LOWB ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LESS ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LBRACK ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | LBRAC ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | HAT ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | EXCL ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | EQUAL ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | DOT ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | DOLLAR ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | COMMA ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | COLONS ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | CHAR _v_2 ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState128
          | BACKSL ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | ALT ->
              let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, MenhirState127) in
              _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
          | RBRACK ->
              let _v_3 = _menhir_action_037 () in
              _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState127 _tok
          | _ ->
              _eRR ())
      | LPAR ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWX ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWW ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWV ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWU ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWT ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWS ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWR ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWP ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWN ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWK ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWF ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWD ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LOWB ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LESS ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LBRACK ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | LBRAC ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | HAT ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | EXCL ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | EQUAL ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | DOT ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | DOLLAR ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | COMMA ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | COLONS ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | CHAR _v_4 ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState127
      | BACKSL ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | ALT ->
          let _menhir_stack = MenhirCell1_classatom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | RBRACK ->
          let a = _v in
          let _v = _menhir_action_114 a in
          _menhir_goto_nonemptyclassranges _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_126 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let c = _v in
      let _v = _menhir_action_038 c in
      _menhir_goto_classatom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_140 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_147 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_141 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_004 () in
      _menhir_goto_assertion _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_assertion : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let a = _v in
      let _v = _menhir_action_172 a in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_142 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_146 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_143 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_144 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_144 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_013 () in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_145 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_005 () in
      _menhir_goto_assertion _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_146 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_140 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_147 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_141 () in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_148 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let c = _v in
      let _v = _menhir_action_121 c in
      _menhir_goto_patterncharacter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_149 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | UPW ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | UPS ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | UPP ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | UPD ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | UPB ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_007 () in
          _menhir_goto_assertion _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | STAR ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | RPAR ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | RBRACK ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | RBRAC ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | QMARK ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | PLUS ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | NZDIGIT _v ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState149
      | MORE ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | MINUS ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LPAR ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LOWX ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LOWW ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LOWV ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LOWU ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LOWT ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LOWS ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LOWR ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LOWP ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LOWN ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LOWK ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_021 () in
          _menhir_goto_atomescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LOWF ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LOWD ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LOWB ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_006 () in
          _menhir_goto_assertion _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | LESS ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LBRACK ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | LBRAC ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | HAT ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | EXCL ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | EQUAL ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | DOT ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | DOLLAR ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | COMMA ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | COLONS ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | CHAR _v ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState149
      | BACKSL ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | ALT ->
          let _menhir_stack = MenhirCell1_BACKSL (_menhir_stack, _menhir_s) in
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
      | _ ->
          _eRR ()
  
  and _menhir_reduce_003 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      let _v = _menhir_action_003 () in
      _menhir_goto_alternative _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_disjunction : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState000 ->
          _menhir_run_204 _menhir_stack _v _tok
      | MenhirState012 ->
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState196 ->
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState193 ->
          _menhir_run_194 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState190 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState187 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState184 ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState015 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_199 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LPAR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let d = _v in
          let _v = _menhir_action_016 d in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_197 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAR, _menhir_box_main) _menhir_cell1_QMARK -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_QMARK (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let d = _v in
          let _v = _menhir_action_017 d in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_194 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAR, _menhir_box_main) _menhir_cell1_QMARK -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_QMARK (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let d = _v in
          let _v = _menhir_action_008 d in
          _menhir_goto_assertion _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_191 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAR, _menhir_box_main) _menhir_cell1_QMARK -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_QMARK (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let d = _v in
          let _v = _menhir_action_009 d in
          _menhir_goto_assertion _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_188 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAR, _menhir_box_main) _menhir_cell1_QMARK -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_QMARK (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let d = _v in
          let _v = _menhir_action_010 d in
          _menhir_goto_assertion _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_185 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_alternative, _menhir_box_main) _menhir_cell1_ALT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ALT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_alternative (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let d = _v in
      let _v = _menhir_action_103 a d in
      _menhir_goto_disjunction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_159 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAR, _menhir_box_main) _menhir_cell1_QMARK -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_QMARK (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let d = _v in
          let _v = _menhir_action_011 d in
          _menhir_goto_assertion _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_157 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let t = _v in
      let _v = _menhir_action_002 t in
      _menhir_goto_alternative _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_122 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let d = _v in
      let _v = _menhir_action_078 d in
      _menhir_goto_classatomnodashchar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_084 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let d = _v in
      let _v = _menhir_action_099 d in
      _menhir_goto_decimaldigits _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_decimaldigits : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState174 ->
          _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState170 ->
          _menhir_run_171 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_177 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_atom, _menhir_box_main) _menhir_cell1_decimaldigits, _menhir_box_main) _menhir_cell1_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_decimaldigits (_menhir_stack, _menhir_s, _v) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState177
      | RBRAC ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | QMARK ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_COMMA (_menhir_stack, _) = _menhir_stack in
              let MenhirCell1_decimaldigits (_menhir_stack, _, dmin) = _menhir_stack in
              let dmax = _v in
              let _v = _menhir_action_095 dmax dmin in
              _menhir_goto_counted_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALT | BACKSL | CHAR _ | COLONS | COMMA | DOLLAR | DOT | EOF | EQUAL | EXCL | HAT | LBRAC | LBRACK | LESS | LOWB | LOWD | LOWF | LOWK | LOWN | LOWP | LOWR | LOWS | LOWT | LOWU | LOWV | LOWW | LOWX | LPAR | MINUS | MORE | NZDIGIT _ | RBRAC | RBRACK | RPAR | UPB | UPD | UPP | UPS | UPW | ZERO ->
              let MenhirCell1_COMMA (_menhir_stack, _) = _menhir_stack in
              let MenhirCell1_decimaldigits (_menhir_stack, _, dmin) = _menhir_stack in
              let dmax = _v in
              let _v = _menhir_action_094 dmax dmin in
              _menhir_goto_counted_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | NZDIGIT _v_0 ->
          let _menhir_stack = MenhirCell1_decimaldigits (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState177
      | _ ->
          _eRR ()
  
  and _menhir_goto_counted_quantifier : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_atom -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_atom (_menhir_stack, _menhir_s, a) = _menhir_stack in
      let cq = _v in
      let _v = _menhir_action_175 a cq in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_171 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_atom as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_decimaldigits (_menhir_stack, _menhir_s, _v) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | RBRAC ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | QMARK ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let d = _v in
              let _v = _menhir_action_091 d in
              _menhir_goto_counted_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALT | BACKSL | CHAR _ | COLONS | COMMA | DOLLAR | DOT | EOF | EQUAL | EXCL | HAT | LBRAC | LBRACK | LESS | LOWB | LOWD | LOWF | LOWK | LOWN | LOWP | LOWR | LOWS | LOWT | LOWU | LOWV | LOWW | LOWX | LPAR | MINUS | MORE | NZDIGIT _ | RBRAC | RBRACK | RPAR | UPB | UPD | UPP | UPS | UPW | ZERO ->
              let d = _v in
              let _v = _menhir_action_090 d in
              _menhir_goto_counted_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | NZDIGIT _v_0 ->
          let _menhir_stack = MenhirCell1_decimaldigits (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState171
      | COMMA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              let _menhir_stack = MenhirCell1_decimaldigits (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, MenhirState171) in
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState174
          | RBRAC ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | QMARK ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let d = _v in
                  let _v = _menhir_action_093 d in
                  _menhir_goto_counted_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ALT | BACKSL | CHAR _ | COLONS | COMMA | DOLLAR | DOT | EOF | EQUAL | EXCL | HAT | LBRAC | LBRACK | LESS | LOWB | LOWD | LOWF | LOWK | LOWN | LOWP | LOWR | LOWS | LOWT | LOWU | LOWV | LOWW | LOWX | LPAR | MINUS | MORE | NZDIGIT _ | RBRAC | RBRACK | RPAR | UPB | UPD | UPP | UPS | UPW | ZERO ->
                  let d = _v in
                  let _v = _menhir_action_092 d in
                  _menhir_goto_counted_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | NZDIGIT _v_1 ->
              let _menhir_stack = MenhirCell1_decimaldigits (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, MenhirState171) in
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState174
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_BACKSL, _menhir_box_main) _menhir_cell1_NZDIGIT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_decimaldigits (_menhir_stack, _menhir_s, _v) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState082
      | NZDIGIT _v_0 ->
          let _menhir_stack = MenhirCell1_decimaldigits (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState082
      | ALT | BACKSL | CHAR _ | COLONS | COMMA | DOLLAR | DOT | EOF | EQUAL | EXCL | HAT | LBRAC | LBRACK | LESS | LOWB | LOWD | LOWF | LOWK | LOWN | LOWP | LOWR | LOWS | LOWT | LOWU | LOWV | LOWW | LOWX | LPAR | MINUS | MORE | PLUS | QMARK | RBRAC | RBRACK | RPAR | STAR | UPB | UPD | UPP | UPS | UPW ->
          let MenhirCell1_NZDIGIT (_menhir_stack, _menhir_s, nz) = _menhir_stack in
          let d = _v in
          let _v = _menhir_action_100 d nz in
          _menhir_goto_decimalescape _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_083 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_decimaldigits -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_decimaldigits (_menhir_stack, _menhir_s, d1) = _menhir_stack in
      let d2 = _v in
      let _v = _menhir_action_098 d1 d2 in
      _menhir_goto_decimaldigits _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState000 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UPW ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UPS ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UPP ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UPD ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UPB ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RBRACK ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RBRAC ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NZDIGIT _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MORE ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWX ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWW ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWV ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWU ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWT ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWS ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWR ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWP ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWN ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWK ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWF ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWD ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LOWB ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LESS ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACK ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRAC ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | HAT ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCL ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EQUAL ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DOT ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DOLLAR ->
          _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COMMA ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COLONS ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHAR _v ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BACKSL ->
          _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ALT | EOF ->
          _menhir_reduce_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 299 "lib/regex_parser.mly"
  
# 5073 "lib/regex_parser.ml"
