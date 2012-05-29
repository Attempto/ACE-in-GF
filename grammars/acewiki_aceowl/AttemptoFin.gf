--# -path=.:present

concrete AttemptoFin of Attempto = NumeralFin, SymbolsC **
  AttemptoI with
  (Syntax = SyntaxFin),
  (Symbolic = SymbolicFin),
  (LexAttempto = LexAttemptoFin) ** open (E=ExtraFin), ResFin in {

  -- VP coordination
  lincat
    VPS = E.VPS ;
    [VPS] = E.ListVPS ;
  lin
    BaseVPS = E.BaseVPS ;
    ConsVPS = E.ConsVPS ;
    vp_as_posVPS = E.MkVPS (mkTemp presentTense simultaneousAnt) positivePol ;
    vp_as_negVPS = E.MkVPS (mkTemp presentTense simultaneousAnt) negativePol ;
    np_coord_VPS np conj vpss = E.PredVPS np (E.ConjVPS conj vpss);

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = s.s} ;

  lincat VPSQ = E.VPS ;
  lincat [VPSQ] = E.ListVPS ;
  lin BaseVPSQ = E.BaseVPS ;
  lin ConsVPSQ = E.ConsVPS ;

  lin ipNPQ ip = lin NP (ip ** {a = agrP3 ip.n ; isNeg = False ; isPron = True}) ;

}
