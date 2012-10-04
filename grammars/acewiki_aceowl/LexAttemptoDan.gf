instance LexAttemptoDan of LexAttempto =
  open
   SyntaxDan,
   ParadigmsDan,
   ConstructX,
   (E = ExtraDan),
   (L = LangDan)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "falsk" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "præcis" ;

} ;
