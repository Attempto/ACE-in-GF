--# -path=.:present

concrete AttemptoSwe of Attempto = SymbolsC, NumeralSwe **
  AttemptoI with
  (Syntax = SyntaxSwe),
  (Symbolic = SymbolicSwe),
  (Extra = ExtraSwe),
  (LexAttempto = LexAttemptoSwe) ** open CommonScand, ResSwe in {

  -- Questions
  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s ! Main} ; -- TODO: Main ?

  lin ipNPQ _ ip = lin NP (ip ** {a = agrP3 ip.g ip.n}) ;

}
