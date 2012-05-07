--# -path=.:ace

concrete AttemptoAce of Attempto = SymbolsC, NumeralAce ** AttemptoI - [vVP] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexAttempto = LexAttemptoAce) ** open ExtraAce in {

  -- Add variant for "John does wait" [JJC]
  lin vVP v = mkVP v | mkVP ExtraAce.do_VV (mkVP v) ;

} ;
