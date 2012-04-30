--# -path=.:present

concrete AttemptoAce of Attempto = SymbolsC, NumeralAce ** AttemptoI - [vVP] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexAttempto = LexAttemptoAce) ** open SyntaxAce, ExtraAce in {

  lincat

  VPS = ExtraAce.VPS ;
  [VPS] = ExtraAce.ListVPS ;

  lin

  -- MkVPS, PredVPS, ConjVPS are functions, not opers

  vp_as_posVPS = MkVPS (mkTemp presentTense simultaneousAnt) positivePol ;

  -- TODO: this causes the compiler to loop?
  --vp_as_negVPS = MkVPS (mkTemp presentTense simultaneousAnt) negativePol ;

  -- Extra: ConjVPS : Conj -> [VPS] -> VPS
  coordVPS = ExtraAce.ConjVPS ;

  predVPS = ExtraAce.PredVPS ;

  BaseVPS = ExtraAce.BaseVPS ;
  ConsVPS = ExtraAce.ConsVPS ;

  -- Add variant for "John does wait" -- [JJC]
  vVP v = mkVP v | mkVP ExtraAce.do_VV (mkVP v) ;

}
