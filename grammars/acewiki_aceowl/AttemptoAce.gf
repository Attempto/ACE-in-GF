--# -path=.:present

concrete AttemptoAce of Attempto = SymbolsC,NumeralAce ** AttemptoI - [which_RP] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexAttempto = LexAttemptoAce) ** open SyntaxAce, ExtraAce in {

lin which_RP = SyntaxAce.which_RP | that_RP ;

} ;
