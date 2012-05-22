--# -path=.:present

concrete AttemptoIta of Attempto = NumeralIta, SymbolsC, NullVPS **
  AttemptoI with
  (Syntax = SyntaxIta),
  (Symbolic = SymbolicIta),
  (LexAttempto = LexAttemptoIta) ** open CommonRomance in {

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s ! Indic} ; -- TODO: Indic ?

  -- lin ipNPQ ip = lin NPQ ( (lin NP ip) ** {a = agrP3 ip.n ; isPron = True} ) ; -- TODO

} ;

