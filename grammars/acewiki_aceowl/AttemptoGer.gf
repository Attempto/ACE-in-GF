--# -path=.:present

concrete AttemptoGer of Attempto = SymbolsC, NumeralGer **
  AttemptoI - [
    CN, PN, NP, V2, V2by, A2, IndefPron, IndefTherePron,
    if_thenS
  ] with
  (Syntax = SyntaxGer),
  (Symbolic = SymbolicGer),
  (Extra = ExtraGer),
  (LexAttempto = LexAttemptoGer) ** open SentenceGer, ResGer, Prelude in {

  flags language = de_DE ;

  printname cat CN = "Substantiv" ;
  lincat CN = Syntax.CN ;

  printname cat PN = "Eigenname" ;
  lincat PN = Syntax.PN ;

  printname cat NP = "Eigenname" ;
  lincat NP = Syntax.NP ;

  printname cat V2 = "Verb" ;
  lincat V2 = Syntax.V2 ;

  printname cat V2by = "Verb" ;
  lincat V2by = Syntax.V2 ;

  printname cat A2 = "Adjektiv" ;
  lincat A2 = Syntax.A2 ;

  -- At the printname-level we do not distinguish between
  -- the different types of indefinite pronouns.
  printname cat IndefPron = "Indefinitpronomen" ;
  printname cat IndefTherePron = "Indefinitpronomen" ;
  lincat IndefPron = Syntax.NP ;
  lincat IndefTherePron = Syntax.NP ;


oper then_Adv = ss "dann" ;

-- Wenn X Y liebt, dann bewundert X Y nicht .
-- mkAdv : Subj -> S -> Adv
-- mkS : Adv -> S -> S
lin if_thenS p q = mkAceS True (ExtAdvS (mkAdv if_Subj p.s) (mkS then_Adv q.s)) ;

-- VP coordination
-- TODO

oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s ! Main} ; -- TODO: Main ?
       
lin ipNPQ ip = lin NP {
      s = \\pcase => ip.s ! kase  where { kase = (prepC pcase).c } ;
      a = agrP3 ip.n ;
      isPron = True
    } ;

}
