--# -path=.:present

concrete AttemptoFin of Attempto = NumeralFin, SymbolsC **
  AttemptoI with -- - [termNP] with
  (Syntax = SyntaxFin),
  (Symbolic = SymbolicFin),
  (Extra = ExtraFin),
  (LexAttempto = LexAttemptoFin) ** open (M=MorphoFin), ResFin in {

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = s.s} ;

  lin ipNPQ ip = lin NP (ip ** {a = agrP3 ip.n ; isNeg = False ; isPron = True}) ;

  -- TODO: this override should put a case ending to the variable,
  -- e.g. Y:n (genitive), unfortunately it does not work with x.s, giving:
  -- gf: Internal error in Compute.Predef:
  -- f::Int->Str->Str got [VInt 1,VP (VGen 0 []) (LIdent "s")]
  -- It works with a fixed string like "X" or "Y".
  --lin termNP x = mkNP (M.nForms2N (M.dSDP x.s));

}
