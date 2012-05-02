instance LexAttemptoSwe of LexAttempto = 
  open ExtraSwe, SyntaxSwe, ParadigmsSwe, ConstructX, 
    MakeStructuralSwe, IrregSwe in {

oper
  false_A = mkA "falsk" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = mkAdN "exakt" ;
}
