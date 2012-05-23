instance LexAttemptoSpa of LexAttempto =
  open
   ExtraSpa,
   SyntaxSpa,
   ParadigmsSpa,
   ConstructX,
   (E = ExtraSpa),
   (L = LangSpa)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "falso" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "exactamente" ;

} ;
