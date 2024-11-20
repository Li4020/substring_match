let char_of_charoption = function None -> '-' | Some x -> x

let transpose matrix =
  let matrix' = Array.make_matrix (Array.length matrix.(0)) (Array.length matrix) 0 in
  for i = 0 to Array.length matrix - 1 do
    for j = 0 to Array.length matrix.(0) - 1 do
      matrix'.(j).(i) <- matrix.(i).(j)
    done
  done;
  matrix'