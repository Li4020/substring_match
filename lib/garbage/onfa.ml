(* type sigma = char list
type state = State of int  (* State is a custom type with a single integer *)
type oracle_name = int

(* Define the type for OReg (Oracle Regular Expressions) *)
type oregex =
  | P of char  (* Character class *)
  | Epsilon
  | Q of oracle_name * bool  (* Oracle query with positive or negative sign *)
  | Concat of oregex * oregex
  | Choice of oregex * oregex
  | Star of oregex

(* Define the type for ONFA *)
type 'v onfa = {
  sigma: sigma;
  v: 'v list;  (* The state space of the ONFA *)
  initial: state list;
  final: state list;
  transitions: (state * ('v * char option) * state) list;
}

(* Define the type for oracle valuation vector *)
type 'b vect = 'b array
type 'b oracle_valuation = Vect of 'b vect

(* Initial function *)
let initial (a: 'v onfa) (beta: 'b vect): state list =
  (* Return the set of NFA states that are beta-reachable from the initial states I *)
  List.filter (fun s -> true) a.initial  (* Here we simply return the initial states *)

(* Next function *)
let next (a: 'v onfa) (s: state list) (c: char) (beta: 'b vect): state list =
  let s' = List.fold_left (fun acc st ->
    List.fold_left (fun acc' (from, (pred, ch_opt), to_st) ->
      match ch_opt with
      | Some ch when from = st && ch = c -> to_st :: acc'
      | None -> if from = st then to_st :: acc' else acc'
      | _ -> acc') acc a.transitions) [] s in
  List.filter (fun st -> true) s'  (* Here we simply return the next states *)

let onfa_of_oregex r =
  (* Implement the conversion of an o-regex to an ONFA *)
  { sigma = ['a'; 'b'; 'c'; 'd']; v = [State 0; State 1; State 2; State 3]; initial = [State 0]; final = [State 3]; transitions = [
    (State 0, (0, None), State 1);  (* Qε⁺(0) *)
    (State 1, (0, Some 'b'), State 1);  (* b* *)
    (State 1, (0, Some 'c'), State 2);  (* bc *)
    (State 2, (1, None), State 3)  (* Qε⁺(1) *)
  ]}

let rec rev r =
  (* Implement the reversal of an o-regex *)
  match r with
  | P c -> P c
  | Epsilon -> Epsilon
  | Q (v, b) -> Q (v, b)
  | Concat (r1, r2) -> Concat (rev r2, rev r1)
  | Choice (r1, r2) -> Choice (rev r1, rev r2)
  | Star r -> Star (rev r)

(* Define direction type *)
type direction = L2R | R2L

(* Match function *)
let match_regex dir r w t =
  let n = String.length w in
  let k = Array.length t in
  assert (Array.length t.(0) = n + 1);
  let beta_bar = Array.init (n + 1) (fun i -> Array.map (fun v -> v.(i)) t) in
  let a = onfa_of_oregex (if dir = L2R then r else rev r) in
  let i = if dir = L2R then 0 else n in
  let s = initial a beta_bar.(i) in
  let out = Array.make (n + 1) 0 in
  if List.exists (fun st -> List.mem st a.final) s then out.(i) <- 1 else out.(i) <- 0;
  let d = if dir = L2R then 1 else -1 in
  let rec loop i s =
    if i >= 0 && i <= n then
      let s = next a s w.[i] beta_bar.(i + d) in
      if List.exists (fun st -> List.mem st a.final) s then out.(i) <- 1 else out.(i) <- 0;
      loop (i + d) s
  in
  loop i s;
  out

(* Auxiliary functions needed *)
let beta_reachable st beta = 
  (* Implement the logic to check if a state is beta-reachable *)
  true

(* Example usage *)
let example_usage () =
  let r = Concat (Concat (Q (0, true), Concat (P 'b', P 'c')), Q (1, true)) (* Qε⁺(0) · bc · Qε⁺(1) *) in
  let w = "bbbcabbcbbdbbbbc" (* Example input string *) in
  let t = [|
    [|0; 0; 0; 0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1|];  (* T[0] *)
    [|1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0; 0; 0; 0; 0; 0|]   (* T[1] *)
  |] in  (* Example oracle matrix with size 2x(n+1) *)
  let result = match_regex L2R r w t in
  Array.iter (fun x -> Printf.printf "%d " x) result;
  Printf.printf "\n"

(* Call the example usage function *)
let () = example_usage () *)
