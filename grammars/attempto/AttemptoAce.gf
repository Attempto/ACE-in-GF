--# -path=.:ace

concrete AttemptoAce of Attempto = SymbolsC, NumeralAce ** AttemptoI with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexAttempto = LexAttemptoAce) ;
