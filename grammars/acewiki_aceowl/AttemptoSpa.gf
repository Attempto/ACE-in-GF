--# -path=.:present

concrete AttemptoSpa of Attempto = SymbolsC, NumeralSpa, NullVPS ** AttemptoI with
  (Syntax = SyntaxSpa),
  (Symbolic = SymbolicSpa),
  (LexAttempto = LexAttemptoSpa) ** open CommonRomance, ResSpa in {

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s ! Indic} ; -- TODO: Indic ?

  -- Copied from ResRomance.heavyNP
  lin ipNPQ ip = lin NP {
    s = \\c => {comp,ton = ip.s ! c ; c1,c2 = []} ;
    a = Ag ip.a.g ip.a.n P3 ;
    hasClit = False ;
    isPol = False
  } ;

} ;
