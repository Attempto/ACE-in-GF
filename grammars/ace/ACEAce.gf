--# -path=.:ace

concrete ACEAce of ACE = AttemptoAce, SymbolsACEC - [Var,var_Term,X_Var,Y_Var] ** ACEI - [vVP] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexACE = LexACEAce) ** open ExtraAce in {

  -- Add variant for "John does wait" [JJC]
  lin vVP v = mkVP v | mkVP ExtraAce.do_VV (mkVP v) ;

} ;
