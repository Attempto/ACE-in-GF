--# -path=.:present

concrete AttemptoAce of Attempto = SymbolsAce {- [Var, var_Term,  X_Var, Y_Var]-}, NumeralAce ** AttemptoI - [vVP, indefPronVarNP] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexAttempto = LexAttemptoAce) ** open SyntaxAce, ExtraAce in {
{-
  -- Genitive for Symbols [JJC]
  param VarCase = Nom | Gen ;
  lincat Var = { s : VarCase => Str };
  lin var_Term i = mkpConst (i.s ! Nom) ;
  lin X_Var = {s = table{ Nom => "X" ; Gen => "X's" }} ;
  lin Y_Var = {s = table{ Nom => "Y" ; Gen => "Y's" }} ;
-}

  lin indefPronVarNP pr v = mkNP pr (SymbolsAce.VartoN v);

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
{-
  -- [JJC]
  indefPronVarNP pr v = lin NP {
    s = \\c => pr.s ! NCase Nom ++ v.s ! (NPCaseToVarCase c) ;
    a = pr.a
  };

  -- TODO
  oper NPCaseToVarCase : Syntax.NPCase -> VarCase = \npc -> case npc of {
    NCase Nom => Nom ;
    _ => Gen
  };
-}
}
