instance LexAttemptoGre of LexAttempto =
  open
   SyntaxGre,
   ParadigmsGre,
   ConstructX,
   (E = ExtraGre),
   (L = LangGre)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "ψευδής" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "ακριβώς" ;

} ;
