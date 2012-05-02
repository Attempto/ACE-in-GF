instance LexAttemptoEng of LexAttempto = 
  open 
   ExtraEng,  
   SyntaxEng, 
   ParadigmsEng, 
   ConstructX, 
   (M = MakeStructuralEng),
   IrregEng in {

oper
  false_A = mkA "false" ;
 
  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ParadigmsEng.mkAdN "exactly" ;

}
