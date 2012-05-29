--# -path=.:present

concrete AttemptoIta of Attempto = NumeralIta, SymbolsC, NullVPS **
  AttemptoI with
  (Syntax = SyntaxIta),
  (Symbolic = SymbolicIta),
  (LexAttempto = LexAttemptoIta) ** open CommonRomance in {

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s ! Indic} ; -- TODO: Indic ?

  -- Copied from ResRomance.heavyNP
  lin ipNPQ ip = lin NP {
    s = \\c => {comp,ton = ip.s ! c ; c1,c2 = []} ;
    a = Ag ip.a.g ip.a.n P3 ;
    isNeg = False ;
    hasClit = False ;
    isPol = False
  } ;

} ;

