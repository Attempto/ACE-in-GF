--# -path=.:present

concrete AttemptoSwe of Attempto = NumeralSwe, SymbolsC ** AttemptoI with
  (Syntax = SyntaxSwe),
  (Symbolic = SymbolicSwe),
  (LexAttempto = LexAttemptoSwe) ** open ExtraSwe in {

  -- VP coordination
  lincat
    VPS = VPS ;
    [VPS] = ListVPS ;
  lin
    BaseVPS = BaseVPS ;
    ConsVPS = ConsVPS ;
    vp_as_posVPS = MkVPS (mkTemp presentTense simultaneousAnt) positivePol ;
    vp_as_negVPS = MkVPS (mkTemp presentTense simultaneousAnt) negativePol ;
    np_coord_VPS np conj vpss = PredVPS np (ConjVPS conj vpss);

}
