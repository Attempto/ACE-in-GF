--# -path=.:present

concrete AttemptoDut of Attempto = SymbolsC, NumeralDut **
  AttemptoI - [if_thenS] with
  (Syntax = SyntaxDut),
  (Symbolic = SymbolicDut),
  (Extra = ExtraDut),
  (LexAttempto = LexAttemptoDut) ** open SentenceDut, ResDut, Prelude in {

oper then_Adv = ss "dan" ;

-- als X Y lief heeft , dan bewondert X niet Y .
-- TODO: would be better: als X Y lief heeft , dan bewondert X Y niet .
--
-- als X Y ziet , dan heeft Y niet X lief .
-- TODO: would be better: als X Y ziet , dan heeft Y X niet lief .
--
-- mkAdv : Subj -> S -> Adv
-- mkS : Adv -> S -> S
lin if_thenS p q = ExtAdvS (mkAdv if_Subj p) (mkS then_Adv q) ;

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s ! Main} ;

  lin ipNPQ _ ip = lin NP (ip ** {a = agrP3 ip.n ; isPron = True}) ;

}
