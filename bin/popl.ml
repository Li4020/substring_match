open Lib;;
open Util;;
open Format;;
open Type;;
open Print;;
open Queue;;
open Converter;;
open Onfa_popl;;

let time : (unit -> 'a) -> 'a * float =
  fun f ->
    let start = Sys.time () in
    let res   = f () in
    let end_  = Sys.time () in
    (res, end_ -. start)

let str = Sys.argv.(1)

let re_str = ".*(?:a*)*(?=.*b.*)"

let re = re_str |> parse_regex

(* let ans = eval true re str

let () = Array.iter print_int ans *)

let find_all_matches_with_overlap eval (dir:bool) (regex: regex) text =
  let rec aux pos acc =
    if pos >= String.length text then List.rev acc
    else
      (* 現在の位置から文字列の部分を渡して評価 *)
      let substr = String.sub text pos (String.length text - pos) in
      if Array.mem 1 (eval dir regex substr) then
        (* マッチした場合、現在の位置を記録し、次の文字位置から再検索 *)
        let () = Onfa_popl.clear () in
        aux (pos + 1) (pos :: acc)
      else
        (* マッチしない場合、次の文字位置に進む *)
        let () = Onfa_popl.clear () in
        aux (pos + 1) acc
  in
  aux 0 []

let answer, time = time (fun () -> find_all_matches_with_overlap eval true re str)

let () = List.iter print_int answer

let () = print_float time


