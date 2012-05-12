--# -path=.:present

concrete AttemptoDut of Attempto = NumeralDut, SymbolsC ** AttemptoI
with
  (Syntax = SyntaxDut),
  (Symbolic = SymbolicDut),
  (LexAttempto = LexAttemptoDut) ;
