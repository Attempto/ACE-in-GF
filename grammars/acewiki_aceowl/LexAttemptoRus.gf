instance LexAttemptoRus of LexAttempto =
  open
   SyntaxRus,
   ParadigmsRus,
   ConstructX,
   (E = ExtraRus),
   (L = LangRus)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "неверно" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "ровно" ;

} ;
