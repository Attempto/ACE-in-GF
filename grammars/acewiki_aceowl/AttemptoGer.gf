--# -path=.:present

concrete AttemptoGer of Attempto = SymbolsC, NumeralGer **
  AttemptoI - [if_thenS] with
  (Syntax = SyntaxGer),
  (Symbolic = SymbolicGer),
  (Extra = ExtraGer),
  (LexAttempto = LexAttemptoGer) ** open SentenceGer, ResGer, Prelude in {

oper then_Adv = ss "dann" ;

-- Wenn X Y liebt, dann bewundert X Y nicht .
-- mkAdv : Subj -> S -> Adv
-- mkS : Adv -> S -> S
lin if_thenS p q = ExtAdvS (mkAdv if_Subj p) (mkS then_Adv q) ;

-- VP coordination
-- TODO

oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s ! Main} ; -- TODO: Main ?
       
lin ipNPQ _ ip = lin NP {
      s = \\pcase => ip.s ! kase  where { kase = (prepC pcase).c } ;
      a = agrP3 ip.n ;
      isPron = True
    } ;

}
