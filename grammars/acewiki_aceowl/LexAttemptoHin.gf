instance LexAttemptoHin of LexAttempto =
  open
   SyntaxHin,
   ParadigmsHin,
   ConstructX,
   (E = ExtraHin),
   (L = LangHin)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "TODO" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = variants {} ;

} ;
