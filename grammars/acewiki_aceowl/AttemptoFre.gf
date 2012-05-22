--# -path=.:present

concrete AttemptoFre of Attempto = NumeralFre, SymbolsC, NullVPS **
  AttemptoI with
  (Syntax = SyntaxFre),
  (Symbolic = SymbolicFre),
  (LexAttempto = LexAttemptoFre) ** open CommonRomance in {

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s ! Indic} ; -- TODO: Indic ?

  -- lin ipNPQ ip = lin NPQ ( (lin NP ip) ** {a = agrP3 ip.n ; isPron = True} ) ; -- TODO

} ;

