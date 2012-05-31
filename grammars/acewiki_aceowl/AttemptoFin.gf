--# -path=.:present

concrete AttemptoFin of Attempto = NumeralFin, SymbolsC **
  AttemptoI with
  (Syntax = SyntaxFin),
  (Symbolic = SymbolicFin),
  (Extra = ExtraFin),
  (LexAttempto = LexAttemptoFin) ** open ResFin in {

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = s.s} ;

  lin ipNPQ ip = lin NP (ip ** {a = agrP3 ip.n ; isNeg = False ; isPron = True}) ;

}
