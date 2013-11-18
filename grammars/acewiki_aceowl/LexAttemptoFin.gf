instance LexAttemptoFin of LexAttempto = 
  open 
   SyntaxFin, 
   ParadigmsFin, 
   ConstructX, 
   (E = ExtraFin),
   (L = LangFin)
   in {

--flags coding=utf8;

oper
  false_A = mkA (mkN "ep�tosi" "ep�toden" "ep�tosia") ;
 
  adj_thatCl : A -> S -> Cl = \a,s -> 
    mkCl (L.UseComp (E.CompPartAP (mkAP (mkAP a) s))) ;

  exactly_AdN = ConstructX.mkAdN "tasan" ;

}
