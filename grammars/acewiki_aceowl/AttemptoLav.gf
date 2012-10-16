--# -path=.:present

concrete AttemptoLav of Attempto = SymbolsC, NumeralLav, NullVPS **
  AttemptoI - [VPS, VPSQ, BaseVPS, BaseVPSQ, ConsVPS, ConsVPSQ, ListVPS, ListVPSQ,
               vp_as_posVPS, vp_as_posVPSQ, vpq_as_posVPSQ,
               vp_as_negVPS, vp_as_negVPSQ, vpq_as_negVPSQ,
               np_coord_VPS, np_coord_VPSQ, npq_coord_VPS,
               v2_byVP] with
  (Syntax = SyntaxLav),
  (Symbolic = SymbolicLav),
  (LexAttempto = LexAttemptoLav) ** {

  oper S2QS : Syntax.S -> Syntax.QS = variants {} ;

  lin v2_byVP v2 np = mkVP (passiveVP v2) (Syntax.mkAdv v2.p np) ;

  lin ipNPQ ip = variants {} ;

} ;
