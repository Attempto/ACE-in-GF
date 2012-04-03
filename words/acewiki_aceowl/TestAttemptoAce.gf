--# -path=.:present

concrete TestAttemptoAce of TestAttempto = AttemptoAce **
  open SyntaxAce, ParadigmsAce, IrregAce, (C = ConstructX) in {

oper mkkN : Str -> CN = \n -> mkCN (ParadigmsAce.mkN n) ;

lin mary_PN = mkPN "Mary" ;
lin woman_N = mkCN (mkN feminine (mkN "woman" "women")) ;
lin friend_N = mkkN "friend" ;
lin ask_V2 = mkV2 "ask" ;
lin mad_A2 = mkA2 (mkA "mad") (mkPrep "about") ;

}
