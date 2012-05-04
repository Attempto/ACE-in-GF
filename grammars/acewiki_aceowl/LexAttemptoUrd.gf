instance LexAttemptoUrd of LexAttempto = 
  open 
   ExtraUrd,  
   SyntaxUrd, 
   ParadigmsUrd, 
   ConstructX, 
   (M = MakeStructuralUrd)
--   IrregUrd 
   in {

oper
  false_A = mkA "GlT" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

}
