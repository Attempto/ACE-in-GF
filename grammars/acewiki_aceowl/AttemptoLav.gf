--# -path=.:present

concrete AttemptoLav of Attempto = SymbolsC, NumeralLav **
  AttemptoI - [VPSQ, BaseVPSQ, ConsVPSQ, ListVPSQ,
               vp_as_posVPSQ, vpq_as_posVPSQ,
               vp_as_negVPSQ, vpq_as_negVPSQ,
               np_coord_VPSQ, npq_coord_VPS,
               v2_byVP, ofCN, falseS
               --, aNP, theNP, noNP, everyNP
               ] with
  (Syntax = SyntaxLav),
  (Symbolic = SymbolicLav),
  (Extra = ExtraLav),
  (LexAttempto = LexAttemptoLav) ** 
  open ParadigmsLav, ResLav in {

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = s.s} ;

  --lin aNP = Syntax.mkNP empty_Det Pl Indef False ;
  --lin theNP = Syntax.mkNP empty_Det Pl Def False ;
  --lin noNP = Syntax.mkNP empty_Det Pl Indef True ;
  --lin everyNP = Syntax.mkNP empty_Det Pl Indef False ;

  lin v2_byVP v2 np = mkVP (passiveVP v2) (Syntax.mkAdv (mkPrep v2.topic) np) ;
    --mkVP (Syntax.VPSlashPrep (passiveVP v2) v2.p) np ;

  lin ofCN cn np = ExtraLav.GenCN np cn ;
    --mkCN mother_N2 (mkNP the_Det king_N) -- mother of the king

  lin falseS s = mkAceS True (mkS negativePol (adj_thatCl false_A s.s)) ;
  
  lin ipNPQ ip = lin NP (ip ** {a = toAgr ip.n P3 Masc ; isNeg = False}) ;

} ;
