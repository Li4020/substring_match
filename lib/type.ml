type query = Q of bool * int
type o_regex =
  | Eps
  | Char of char
  | Any
  | Query of bool * int
  | Seq of o_regex * o_regex
  | Alt of o_regex * o_regex
  | Star of o_regex
  | Plus of o_regex
  | Opt of o_regex

type regex =
  | Eps
  | Char of char
  | Any
  | Seq of regex * regex
  | Alt of regex * regex
  | Star of regex
  | Plus of regex
  | Opt of regex
  | PLA of regex
  | NLA of regex
  | PLB of regex
  | NLB of regex

module StateSet = Set.Make(Int)
module AlphSet = Set.Make(Char)

type transition = {q: int; sym: char; q' : int}
type etransition = {eq: int; eq' : int}
type qtransition = {q: int; qry: query; q' : int}

type onfa = {
  states : StateSet.t;
  alph : AlphSet.t;
  trans : transition list;
  etrans : etransition list;
  qtrans : qtransition list;
  start : StateSet.t;
  final : StateSet.t;
}