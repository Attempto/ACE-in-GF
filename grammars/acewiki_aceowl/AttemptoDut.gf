--# -path=.:present

concrete AttemptoDut of Attempto = SymbolsC, NumeralDut **
  AttemptoI - [if_thenS] with
  (Syntax = SyntaxDut),
  (Symbolic = SymbolicDut),
  (LexAttempto = LexAttemptoDut) ** open (E=ExtraDut), SentenceDut, ResDut, Prelude in {

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

  -- VP coordination
  lincat
    VPS = E.VPS ;
    [VPS] = E.ListVPS ;
  lin
    BaseVPS = E.BaseVPS ;
    ConsVPS = E.ConsVPS ;
    vp_as_posVPS = E.MkVPS (mkTemp presentTense simultaneousAnt) positivePol ;
    vp_as_negVPS = E.MkVPS (mkTemp presentTense simultaneousAnt) negativePol ;
    np_coord_VPS np conj vpss = E.PredVPS np (E.ConjVPS conj vpss);

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s ! Main} ;

  lincat VPSQ = E.VPS ;
  lincat [VPSQ] = E.ListVPS ;
  lin BaseVPSQ = E.BaseVPS ;
  lin ConsVPSQ = E.ConsVPS ;

  lin ipNPQ ip = lin NP (ip ** {a = agrP3 ip.n ; isPron = True}) ;

}
