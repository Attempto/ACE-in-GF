--# -path=.:present

concrete AttemptoSwe of Attempto = NumeralSwe, SymbolsC **
  AttemptoI with
  (Syntax = SyntaxSwe),
  (Symbolic = SymbolicSwe),
  (LexAttempto = LexAttemptoSwe) ** open (E=ExtraSwe), CommonScand, ResSwe in { -- opened with E= to stop inheritance of unqualified names

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

  -- Questions
  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s ! Main} ; -- TODO: Main ?

  lincat VPSQ = E.VPS ;
  lincat [VPSQ] = E.ListVPS ;
  lin BaseVPSQ = E.BaseVPS ;
  lin ConsVPSQ = E.ConsVPS ;

  lin ipNPQ ip = lin NP (ip ** {a = agrP3 ip.g ip.n}) ;

}
