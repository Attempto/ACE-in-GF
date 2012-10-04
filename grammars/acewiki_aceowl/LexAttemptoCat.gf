instance LexAttemptoCat of LexAttempto =
  open
   SyntaxCat,
   ParadigmsCat,
   ConstructX,
   (E = ExtraCat),
   (L = LangCat)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "fals" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "exactament" ;

} ;
