instance LexAttemptoUrd of LexAttempto = 
  open 
   ExtraUrd,  
   SyntaxUrd, 
   ParadigmsUrd, 
   ConstructX
   in {

flags coding=utf8;

oper
  false_A = mkA "GlT" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ParadigmsUrd.mkAdN "TODO" ;
}
