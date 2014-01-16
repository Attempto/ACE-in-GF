instance LexAttemptoAfr of LexAttempto = open SyntaxAfr, ParadigmsAfr, ConstructX in {

flags coding=utf8;

oper
  false_A = ParadigmsAfr.mkA "vals" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "presies" ;

}
