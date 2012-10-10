instance LexAttemptoEst of LexAttempto =
  open
   SyntaxEst,
   ParadigmsEst,
   ConstructX,
   (E = ExtraEst),
   (L = LangEst)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "vale" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "täpselt" ;

} ;
