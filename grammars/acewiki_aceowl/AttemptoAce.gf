--# -path=.:present

concrete AttemptoAce of Attempto = SymbolsC [Term], NumeralAce ** AttemptoI - [apposVarCN, indefPronVarNP, vVP] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexAttempto = LexAttemptoAce) ** open SyntaxAce, ExtraAce, ResAce, Precedence in {

  -- Variables have genitives [JJC]
  lincat Var = {s : Case => Str};
  lin var_Term v = mkpConst (NomVar v) ;
  lin X_Var = {s = regGenitiveS "X"} ;
  lin Y_Var = {s = regGenitiveS "Y"} ;
  oper NomVar : {s : Case => Str} -> Str = \v -> v.s ! Nom ;

  -- "somebody X" etc  [JJC]
  lin indefPronVarNP pr v = lin NP {
    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case c) ; -- with genitive "somebody X's"
--    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case (NCase Nom)) ; -- no inflection for genitive
    a = pr.a
  };

  -- We overide this because of the linearisation of Var [JJC]
  lin apposVarCN cn v = mkCN cn (symb (NomVar v)) ;


  lincat
    VPS = ExtraAce.VPS ;
    [VPS] = ExtraAce.ListVPS ;

  lin

  -- VP coordination with reduced ambiguity [JJC]
  BaseVPS = ExtraAce.BaseVPS ;
  ConsVPS = ExtraAce.ConsVPS ;
  vp_as_posVPS = MkVPS (mkTemp presentTense simultaneousAnt) positivePol ;
  vp_as_negVPS = MkVPS (mkTemp presentTense simultaneousAnt) UncNeg ;
  np_coord_VPS np conj vpss = ExtraAce.PredVPS np (ExtraAce.ConjVPS conj vpss);

  -- Add variant for "John does wait" [JJC]
  vVP v = mkVP v | mkVP ExtraAce.do_VV (mkVP v) ;

}
