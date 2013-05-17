instance LexAttemptoChi of LexAttempto =
  open
   SyntaxChi,
   ParadigmsChi,
   ConstructX,
   (E = ExtraChi),
   (L = LangChi)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "TODO" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "TODO" ;

} ;
