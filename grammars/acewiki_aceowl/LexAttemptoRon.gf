instance LexAttemptoRon of LexAttempto =
  open
   SyntaxRon,
   ParadigmsRon,
   ConstructX,
   (E = ExtraRon),
   (L = LangRon)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "fals" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "exact" ;

} ;
