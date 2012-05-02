--# -path=.:present

concrete AttemptoAce of Attempto = SymbolsAce, NumeralAce ** AttemptoI - [apposVarCN, indefPronVarNP, vVP] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexAttempto = LexAttemptoAce) ** open SyntaxAce, ExtraAce in {

  -- IndefPron -> Var -> NP [JJC]
  -- We use an oper to reduce the headaches with importing everything in this module
  lin indefPronVarNP pr v = SymbolsAce.IPronVarNP pr v ;

  -- We overide this because of the linearisation of Var [JJC]
  lin apposVarCN cn v = mkCN cn (symb (NomVar v)) ;


  lincat

  VPS = ExtraAce.VPS ;
  [VPS] = ExtraAce.ListVPS ;

  lin

  -- MkVPS, PredVPS, ConjVPS are functions, not opers

  vp_as_posVPS = MkVPS (mkTemp presentTense simultaneousAnt) positivePol ;

  -- TODO: this causes the compiler to loop?
  --vp_as_negVPS = MkVPS (mkTemp presentTense simultaneousAnt) negativePol ;

  -- Extra: ConjVPS : Conj -> [VPS] -> VPS
  coordVPS = ExtraAce.ConjVPS ;

  predVPS = ExtraAce.PredVPS ;

  BaseVPS = ExtraAce.BaseVPS ;
  ConsVPS = ExtraAce.ConsVPS ;

  -- Add variant for "John does wait" -- [JJC]
  vVP v = mkVP v | mkVP ExtraAce.do_VV (mkVP v) ;

}
