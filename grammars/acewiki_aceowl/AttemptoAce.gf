--# -path=.:present

concrete AttemptoAce of Attempto = SymbolsC [Term], NumeralAce **
  AttemptoI - [apposVarCN, indefTherePronVarNP, indefPronVarNP, vp_as_negVPS] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (Extra = ExtraAce),
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

  lin vp_as_negVPS = MkVPS (mkTemp presentTense simultaneousAnt) AnyNeg ;

  -- Questions
  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s} ;

  lin ipNPQ ip = lin NP (ip ** {a = agrP3 ip.n}) ;

}
