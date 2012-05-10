--# -path=.:present

concrete AttemptoGer of Attempto = SymbolsC, NumeralGer ** AttemptoI with
  (Syntax = SyntaxGer),
  (Symbolic = SymbolicGer),
  (LexAttempto = LexAttemptoGer) ;

