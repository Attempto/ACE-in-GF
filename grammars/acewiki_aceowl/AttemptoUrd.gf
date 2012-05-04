--# -path=.:./present
concrete AttemptoUrd of Attempto = NumeralUrd, SymbolsC ** AttemptoI - [mustVP] with
  (Syntax = SyntaxUrd),
  (Symbolic = SymbolicUrd),
  (LexAttempto = LexAttemptoUrd) ;

