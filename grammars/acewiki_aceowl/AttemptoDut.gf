--# -path=.:present

concrete AttemptoDut of Attempto = NumeralDut [Numeral, Digits], SymbolsC ** AttemptoI
with
  (Syntax = SyntaxDut),
  (Symbolic = SymbolicDut),
  (LexAttempto = LexAttemptoDut) ;
