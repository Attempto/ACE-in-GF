instance LexAttemptoPol of LexAttempto =
  open
   SyntaxPol,
   ParadigmsPol,
   ConstructX,
   (L = LexiconPol)
   in {

flags coding=utf8 ;

oper
  false_A = L.bad_A ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "dokładnie" ;

} ;
