--# -path=.:./present
concrete AttemptoUrd of Attempto = NumeralUrd, SymbolsC, NullVPS **
  AttemptoI - [mustVP,
               VPS, VPSQ, BaseVPS, BaseVPSQ, ConsVPS, ConsVPSQ, ListVPS, ListVPSQ,
               vp_as_posVPS, vp_as_posVPSQ, vpq_as_posVPSQ,
               vp_as_negVPS, vp_as_negVPSQ, vpq_as_negVPSQ,
               np_coord_VPS, np_coord_VPSQ, npq_coord_VPS] with
  (Syntax = SyntaxUrd),
  (Symbolic = SymbolicUrd),
  (LexAttempto = LexAttemptoUrd) ** open CommonHindustani in {

lin ipNPQ ip = lin NP {
      s = \\c => case c of { NPC cs => ip.s ! cs ; _ => ip.s ! Dir } ;
      a = agrP3 ip.g ip.n
    } ;

} ;
