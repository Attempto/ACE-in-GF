instance LexAttemptoDut of LexAttempto = open SyntaxDut, ParadigmsDut, ConstructX in {

flags coding=utf8;

oper
  false_A = ParadigmsDut.mkA "onwaar" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "precies" ;

}
