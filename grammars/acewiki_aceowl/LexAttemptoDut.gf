instance LexAttemptoDut of LexAttempto = open SyntaxDut, ParadigmsDut, ConstructX in {

flags coding=utf8;

oper
  false_A = ParadigmsDut.mkA "falsch" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "genau" ;

}
