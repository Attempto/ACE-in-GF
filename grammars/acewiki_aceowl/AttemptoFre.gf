--# -path=.:present

concrete AttemptoFre of Attempto = NumeralFre, SymbolsC **
  AttemptoI with
  (Syntax = SyntaxFre),
  (Symbolic = SymbolicFre),
  (Extra = ExtraFre),
  (LexAttempto = LexAttemptoFre) ** open CommonRomance in {

  -- Copied from ResRomance.heavyNP
  lin ipNPQ ip = lin NP {
    s = \\c => {comp,ton = ip.s ! c ; c1,c2 = []} ;
    a = Ag ip.a.g ip.a.n P3 ;
    isNeg = False ;
    hasClit = False ;
    isPol = False
  } ;

} ;

