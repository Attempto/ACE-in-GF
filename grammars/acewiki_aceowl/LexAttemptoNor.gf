instance LexAttemptoNor of LexAttempto =
  open
   ExtraNor,
   SyntaxNor,
   ParadigmsNor,
   ConstructX,
   (E = ExtraNor),
   (L = LangNor)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "falsk" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "nøyaktig" ;

} ;
