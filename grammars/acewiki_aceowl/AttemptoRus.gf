--# -path=.:present

concrete AttemptoRus of Attempto = SymbolsC, NumeralRus, NullVPS **
  AttemptoI - [noNP, nobody_IPron, nothing_IPron,
               VPS, VPSQ, BaseVPS, BaseVPSQ, ConsVPS, ConsVPSQ, ListVPS, ListVPSQ,
               vp_as_posVPS, vp_as_posVPSQ, vpq_as_posVPSQ,
               vp_as_negVPS, vp_as_negVPSQ, vpq_as_negVPSQ,
               np_coord_VPS, np_coord_VPSQ, npq_coord_VPS] with
  (Syntax = SyntaxRus),
  (Symbolic = SymbolicRus),
  (LexAttempto = LexAttemptoRus) ** open ResRus in {

  flags coding=utf8;

  oper S2QS : Syntax.S -> Syntax.QS = variants {};

  oper at_least_AdN = ss "по крайней мере" ;
  oper at_most_AdN = ss "не более" ;
  oper if_then_Conj = {s1 = "если" ; s2 = "то" ; n = Sg } ;

  lin ipNPQ ip = variants {};
  lin noNP, nobody_IPron, nothing_IPron = variants {};

} ;
