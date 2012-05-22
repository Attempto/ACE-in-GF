--# -path=.:present

concrete AttemptoAce of Attempto = SymbolsC [Term], NumeralAce [Digits] **
  AttemptoI - [apposVarCN, indefTherePronVarNP, indefPronVarNP] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexAttempto = LexAttemptoAce) ** open ExtraAce, ResAce, Precedence in {

  -- Variables have genitives [JJC]
  lincat Var = {s : Case => Str};
  lin var_Term v = mkpConst (NomVar v) ;
  lin X_Var = {s = regGenitiveS "X"} ;
  lin Y_Var = {s = regGenitiveS "Y"} ;
  oper NomVar : {s : Case => Str} -> Str = \v -> v.s ! Nom ;

  -- "everybody X" etc [JJC]
  lin indefPronVarNP pr v = lin NP {
    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case c) ; -- with genitive "somebody X's"
--    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case (NCase Nom)) ; -- no inflection for genitive
    a = pr.a
  };

  -- "somebody X" and "something X" [KK]
  lin indefTherePronVarNP pr v = lin NP {
    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case c) ; -- with genitive "somebody X's"
    a = pr.a
  };

  -- We override this because of the linearisation of Var [JJC]
  lin apposVarCN cn v = mkCN cn (symb (NomVar v)) ;

  -- VP coordination
  lincat
    VPS = ExtraAce.VPS ;
    [VPS] = ExtraAce.ListVPS ;
  lin
    BaseVPS = ExtraAce.BaseVPS ;
    ConsVPS = ExtraAce.ConsVPS ;
    vp_as_posVPS = MkVPS (mkTemp presentTense simultaneousAnt) positivePol ;
    vp_as_negVPS = MkVPS (mkTemp presentTense simultaneousAnt) AnyNeg ;
    np_coord_VPS np conj vpss = ExtraAce.PredVPS np (ExtraAce.ConjVPS conj vpss);

  -- Questions
  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s} ;

  lincat VPSQ = ExtraAce.VPS ;
  lincat [VPSQ] = ExtraAce.ListVPS ;
  lin BaseVPSQ = ExtraAce.BaseVPS ;
  lin ConsVPSQ = ExtraAce.ConsVPS ;

  lin ipNPQ ip = lin NP (ip ** {a = agrP3 ip.n}) ;

}
