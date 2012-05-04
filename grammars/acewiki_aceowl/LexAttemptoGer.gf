instance LexAttemptoGer of LexAttempto = 
  open ExtraGer, SyntaxGer, ParadigmsGer, ConstructX,
    MakeStructuralGer, 
    IrregGer, Prelude in {

flags coding=utf8;

oper
  false_A = mkA "falsch" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = mkAdN "genau" ;

}
