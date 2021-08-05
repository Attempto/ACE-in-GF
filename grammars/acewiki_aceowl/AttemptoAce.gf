--# -path=.:present

concrete AttemptoAce of Attempto = NumeralAce **
  AttemptoI - [
    CN, PN, NP, V2, V2by, A2,
    apposVarCN, indefTherePronVarNP, indefPronVarNP, vp_as_negVPS,
    termNP
  ] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (Extra = ExtraAce),
  (LexAttempto = LexAttemptoAce) ** open ExtraAce, ResAce, Precedence in {

  -- The (preferred) locale of ACE is "en" (without any qualifiers).
  flags language = en ;

  printname cat CN = "Common Noun" ;
  lincat CN = Syntax.CN ;

  printname cat PN = "Proper Name" ;
  lincat PN = Syntax.PN ;

  printname cat NP = "Proper Name" ;
  lincat NP = Syntax.NP ;

  printname cat V2 = "Transitive Verb" ;
  lincat V2 = Syntax.V2 ;

  printname cat V2by = "Transitive Verb" ;
  lincat V2by = Syntax.V2 ;

  printname cat A2 = "Transitive Adjective" ;
  lincat A2 = Syntax.A2 ;

  -- Variables have genitives [JJC]
  printname cat Var = "Reference" ;
  lincat Var = {s : Case => Str};

  lin X_Var = {s = regGenitiveS "X"} ;
  lin Y_Var = {s = regGenitiveS "Y"} ;
  lin Z_Var = {s = regGenitiveS "Z"} ;
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

  lin termNP v = symb (NomVar v) ;

  lin vp_as_negVPS = MkVPS (mkTemp presentTense simultaneousAnt) AnyNeg ;

  -- Questions
  lin ipNPQ ip = lin NP (ip ** {a = agrP3 ip.n}) ;

}
