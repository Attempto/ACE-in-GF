--# -path=.:present

concrete AttemptoSwe of Attempto = SymbolsC, NumeralSwe **
  AttemptoI with
  (Syntax = SyntaxSwe),
  (Symbolic = SymbolicSwe),
  (Extra = ExtraSwe),
  (LexAttempto = LexAttemptoSwe) ** open CommonScand, ResSwe in {

  -- Questions
  lin ipNPQ ip = it_NP ** ip ** {a = agrP3 ip.g ip.n} ;

}
