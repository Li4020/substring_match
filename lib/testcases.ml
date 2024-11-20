open Type;;

let string = "bbbcabbcbbdbbbc"
let string = "01100100010111"

let re: regex = PLA (Seq (Char 'a', Seq (Char 'b', Char 'c')))
let re: regex = Seq (Star Any, (Seq (Char 'b', Char 'b')))
let re: regex = Seq (PLB (Star Any), (Seq (Char 'b', Char 'b')))
let re: regex = Seq (PLA (Star Any), (Seq (Char 'b', Seq (Char 'b', PLB (Star Any)))))
let re2 : regex = Seq (Star Any, (Seq (PLB (Seq (Star Any, Seq (Char 'a', Star Any))), Seq (Char 'b', Seq (Char 'c', (PLA (Seq (Star Any, Seq (Char 'd', Star Any)))))))))
let re3 : regex = Seq (Star Any, (Seq (PLB (Seq (Star Any, Seq (Char 'a', Star Any))), Seq (Char 'b', (PLA (Seq (Star Any, Seq (Char 'd', Star Any))))))))
(* 学会スライドに記載されていた例 *)
let re4 : regex = Seq (Star Any, (Seq (PLB (Seq (Star Any, Seq (Char 'a', Star Any))), Seq (Char 'b', Seq (Char 'b', (PLA (Seq (Star Any, Seq (Char 'd', Star Any)))))))))
let re4 : regex = Seq (Star Any, (Seq (PLB (Seq (Star Any, Seq (Char 'a', Star Any))), Seq (Char 'b', Seq (Char 'b', (PLA (Seq (Star Any, Seq (Char 'b', Star Any)))))))))
let re5 : regex = Seq (Star Any,Seq (Seq (Seq (PLB (Seq (Star Any, Seq (Char '1', Seq (Char '1', Star Any)))), Char '0'), Char '0'), PLA (Seq (Star Any, Seq (Char '1', Seq (Char '0', Seq (Char '0', Star Any)))))))
let re6 : regex = Seq (Seq (Seq (PLB (Seq (Star Any, Seq (Char 'b', Seq (Char 'b', Star Any)))), Char 'a'), Char 'a'), PLA (Seq (Star Any, Seq (Char 'b', Seq (Char 'a', Seq (Char 'a', Star Any))))))

let o_regex: o_regex = (Seq (Query (true, 0), Seq (Char 'b', Seq (Char 'c', Query (true, 1)))))

(* .*Q+(0)bcQ+(1) *)
let o_regex: o_regex = Seq (Star Any, (Seq (Query (true, 0), Seq (Char 'b', Seq (Char 'c', Query (true, 1))))))

let o_regex2: o_regex = Seq (Star Any, (Seq (Query (true, 0), Seq (Char '0', Seq (Char '0', Query (true, 1))))))

let o_regex2: o_regex = (Seq (Query (true, 0), Seq (Char '0', Seq (Char '0', Query (true, 1)))))