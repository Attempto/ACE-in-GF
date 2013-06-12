instance LexAttemptoMlt of LexAttempto =
  open
   SyntaxMlt,
   ParadigmsMlt,
   ConstructX,
   (E = ExtraMlt),
   (L = LangMlt)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "falza" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "eżattament" ;

} ;
