--# -path=.:present

concrete AttemptoAce of Attempto = SymbolsC, NumeralAce ** AttemptoI with
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

}
