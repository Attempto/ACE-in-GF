--# -path=.:present

concrete AttemptoFin of Attempto = NumeralFin, SymbolsC, NullVPS **
  AttemptoI - [S2QS] with
  (Syntax = SyntaxFin),
  (Symbolic = SymbolicFin),
  (LexAttempto = LexAttemptoFin) ** {

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = s.s} ;
       
  lin ipNPQ = variants {} ; -- TODO

}

