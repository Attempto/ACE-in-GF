--# -path=.:present

concrete TestAttemptoAce of TestAttempto = AttemptoAce **
  open SyntaxAce, ParadigmsAce, IrregAce, (C = ConstructX) in {

oper mkkN : Str -> SyntaxAce.CN = \n -> mkCN (ParadigmsAce.mkN n) ;

lin mary_PN = mkPN "Mary" ;
lin john_PN = mkPN "John" ;
lin woman_N = mkCN (mkN feminine (mkN "woman" "women")) ;
lin man_N = mkCN (mkN masculine (mkN "man" "men")) ;
lin friend_N = mkkN "friend" ;
lin ask_V2 = mkV2 "ask" ;
lin mad_A = mkA "mad" ;
lin mad_about_A2 = mkA2 mad_A (mkPrep "about") ;
lin happy_A = mkA "happy" ;

}
