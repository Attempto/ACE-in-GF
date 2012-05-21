--# -path=.:present

concrete AttemptoGer of Attempto = SymbolsC, NumeralGer ** AttemptoI - [if_thenS] with
  (Syntax = SyntaxGer),
  (Symbolic = SymbolicGer),
  (LexAttempto = LexAttemptoGer) ** open SentenceGer, Prelude in {

oper then_Adv = ss "dann" ;

-- Wenn X Y liebt, dann bewundert X Y nicht .
-- mkAdv : Subj -> S -> Adv
-- mkS : Adv -> S -> S
lin if_thenS p q = ExtAdvS (mkAdv if_Subj p) (mkS then_Adv q) ;

}
