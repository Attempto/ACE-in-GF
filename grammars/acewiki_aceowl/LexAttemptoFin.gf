instance LexAttemptoFin of LexAttempto = 
  open 
   ExtraFin,  
   SyntaxFin, 
   ParadigmsFin, 
   ConstructX, 
   (M = MakeStructuralFin),
   (E = ExtraFin),
   (L = LangFin)
   in {

oper
  false_A = mkA (mkN "epätosi" "epätoden" "epätosia") ;
 
  adj_thatCl : A -> S -> Cl = \a,s -> 
    mkCl (L.UseComp (E.CompPartAP (mkAP (mkAP a) s))) ;

  exactly_AdN = mkAdN "tasan" ;

}
