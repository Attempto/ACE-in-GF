--# -path=.:present

concrete AttemptoEst of Attempto = SymbolsC, NumeralEst **
  AttemptoI with
  (Syntax = SyntaxEst),
  (Symbolic = SymbolicEst),
  (Extra = ExtraEst),
  (LexAttempto = LexAttemptoEst) ** {

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = s.s} ;

  --Fin: lin ipNPQ ip = lin NP (ip ** {a = agrP3 ip.n ; isNeg = False ; isPron = True}) ;
  lin ipNPQ ip = variants {};

} ;
