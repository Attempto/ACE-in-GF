--# -path=.:present

concrete AttemptoLav of Attempto = SymbolsC, NumeralLav, NullVPS **
  AttemptoI - [VPS, VPSQ, BaseVPS, BaseVPSQ, ConsVPS, ConsVPSQ, ListVPS, ListVPSQ,
               vp_as_posVPS, vp_as_posVPSQ, vpq_as_posVPSQ,
               vp_as_negVPS, vp_as_negVPSQ, vpq_as_negVPSQ,
               np_coord_VPS, np_coord_VPSQ, npq_coord_VPS,
               v2_byVP
               --, aNP, theNP, noNP, everyNP
               ] with
  (Syntax = SyntaxLav),
  (Symbolic = SymbolicLav),
  (LexAttempto = LexAttemptoLav) ** 
  open ExtraLav in {

  oper S2QS : Syntax.S -> Syntax.QS = variants {} ;

  --lin aNP = Syntax.mkNP empty_Det Pl Indef False ;
  --lin theNP = Syntax.mkNP empty_Det Pl Def False ;
  --lin noNP = Syntax.mkNP empty_Det Pl Indef True ;
  --lin everyNP = Syntax.mkNP empty_Det Pl Indef False ;

  lin v2_byVP v2 np = mkVP (passiveVP v2) (Syntax.mkAdv v2.p np) ;

  lin ipNPQ ip = variants {} ;

} ;
