concrete AttemptoChi of Attempto = SymbolsC, NumeralChi, NullVPS **
  AttemptoI - [
               VPS, VPSQ, BaseVPS, BaseVPSQ, ConsVPS, ConsVPSQ, ListVPS, ListVPSQ,
               vp_as_posVPS, vp_as_posVPSQ, vpq_as_posVPSQ,
               vp_as_negVPS, vp_as_negVPSQ, vpq_as_negVPSQ,
               np_coord_VPS, np_coord_VPSQ, npq_coord_VPS] with
  (Syntax = SyntaxChi),
  (Symbolic = SymbolicChi),
  (LexAttempto = LexAttemptoChi) ** {

  oper S2QS : Syntax.S -> Syntax.QS = variants {};

  lin ipNPQ ip = variants {};

} ;
