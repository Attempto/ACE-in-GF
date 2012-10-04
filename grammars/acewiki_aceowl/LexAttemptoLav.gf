instance LexAttemptoLav of LexAttempto =
  open
   ExtraLav,
   SyntaxLav,
   ParadigmsLav,
   ConstructX,
   (E = ExtraLav),
   (L = LangLav)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "nepatiesa" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "tieši" ;

} ;
