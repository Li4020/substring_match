open Lib;;
open Format;;
open Dfa;;
open Nfa;;
open Regex;;

type query = Q of bool * int
type t =
  | Eps
  | Char of char
  | Query of bool * int
  | Seq of t * t
  | Alt of t * t
  | Star of t
  | Plus of t
  | Opt of t

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

let null_nfa = {
  states = StateSet.of_list [0; 1];
  alph = AlphSet.empty;
  trans = [];
  etrans = [{eq = 0; eq' = 1}];
  qtrans = [];
  start = StateSet.of_list [0];
  final = StateSet.of_list [1];
}

let query_nfa sgn o_name = {
  states = StateSet.of_list [0; 1];
  alph = AlphSet.empty;
  trans = [];
  etrans = [];
  qtrans = [{q = 0; qry = Q(sgn, o_name); q' = 1}];
  start = StateSet.of_list [0];
  final = StateSet.of_list [1];
}

let char_nfa a = {
  states = StateSet.of_list [0; 1];
  alph = AlphSet.singleton a;
  trans = [{q = 0; sym = a; q' = 1}];
  etrans = [];
  qtrans = [];
  start = StateSet.of_list [0];
  final = StateSet.of_list [1];
}

(* let reindexList l start =
  List.map (fun x -> x + start) l *)

let reindexNfa a start ={
  states = StateSet.map (fun x -> x + start) a.states;
  alph = a.alph;
  trans = List.map (fun (x: transition) -> {q = x.q + start; sym = x.sym; q' = x.q' + start}) a.trans;
  etrans = List.map (fun (x: etransition) -> {eq = x.eq + start; eq' = x.eq' + start}) a.etrans;
  qtrans = List.map (fun (x: qtransition) -> {q = x.q + start; qry = x.qry; q' = x.q' + start}) a.qtrans;
  start = StateSet.map (fun x -> x + start) a.start;
  final = StateSet.map (fun x -> x + start) a.final;
}

let concatNfa a b =
  let concatNfa' a b = {
    states = StateSet.union a.states b.states;
    alph = AlphSet.union a.alph b.alph;
    trans = a.trans @ b.trans;
    etrans = (List.map2 (fun x y -> {eq = x; eq' = y}) (StateSet.elements a.final) (StateSet.elements b.start)) @ (a.etrans @ b.etrans);
    qtrans = a.qtrans @ b.qtrans;
    start = a.start;
    final = b.final;
  } in
  concatNfa' (reindexNfa a 0) (reindexNfa b (StateSet.cardinal a.states))

let thompson a =
  let thompson' a start final = {
    states = StateSet.add start (StateSet.add final a.states);
    alph = a.alph;
    trans = a.trans;
    etrans = List.map (fun x -> {eq=start; eq'=x}) (StateSet.elements a.start) @ List.map (fun x -> {eq=x; eq'=final}) (StateSet.elements a.final) @ a.etrans;
    qtrans = a.qtrans;
    start = StateSet.singleton start;
    final = StateSet.singleton final;
  }in
  let start = StateSet.cardinal a.states in
  let final = StateSet.cardinal a.states + 1 in
  thompson' a start final

let unionNfa a b =
  let unionNfa' a b = {
    states = StateSet.union a.states b.states;
    alph = AlphSet.union a.alph b.alph;
    trans = a.trans @ b.trans;
    etrans = a.etrans @ b.etrans;
    qtrans = a.qtrans @ b.qtrans;
    start = StateSet.union a.start b.start;
    final = StateSet.union a.final b.final;
  } in
  unionNfa' (reindexNfa a 0) (reindexNfa b (StateSet.cardinal a.states))
  |> thompson

let starNfa a =
  let starNfa' a start final = {
    states = StateSet.add start (StateSet.add final a.states);
    alph = a.alph;
    trans = a.trans;
    etrans = {eq = start; eq' = final} :: List.map (fun x -> {eq=start; eq'=x}) (StateSet.elements a.start) @ List.map (fun x -> {eq=x; eq'=final}) (StateSet.elements a.final) @ (List.map2 (fun x y -> {eq=x; eq'=y}) (StateSet.elements a.start) (StateSet.elements a.final)) @ a.etrans;
    qtrans = a.qtrans;
    start = StateSet.singleton start;
    final = StateSet.singleton final;
  }in
  let start = StateSet.cardinal a.states in
  let final = StateSet.cardinal a.states + 1 in
  starNfa' a start final
