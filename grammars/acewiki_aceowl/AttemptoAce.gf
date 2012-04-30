--# -path=.:present

concrete AttemptoAce of Attempto = SymbolsC, NumeralAce ** AttemptoI - [vVP] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexAttempto = LexAttemptoAce) ** open SyntaxAce, ExtraAce in {

  lincat

  VPS = ExtraAce.VPS ;
  --ListVPS = ExtraAce.ListVPS ;


  lin

  vp_as_posVPS = MkVPS (mkTemp presentTense simultaneousAnt) positivePol ;
  --vp_as_negVPS = MkVPS (mkTemp presentTense simultaneousAnt) negativePol ;
  --coordVPS = ConjVPS ;
  predVPS = PredVPS ;

  -- Add variant for "John does wait" -- [JJC]
  vVP v = mkVP v | mkVP ExtraAce.do_VV (mkVP v) ;

}
