incomplete concrete AttemptoI of Attempto = SymbolsC, Numeral ** open 
  Syntax, 
  Symbolic,
  Prelude,
  LexAttempto 
in {

lincat CN = Syntax.CN ; VarCN = Syntax.CN ;
lincat NP = Syntax.NP ; lincat ThereNP = Syntax.NP ; lincat NPQ = Syntax.NP ;
lincat Card = Syntax.Card ;
--lincat Numeral = Syntax.Numeral ;
lincat PN = Syntax.PN ;
lincat A = Syntax.A ;
lincat A2 = Syntax.A2 ;
lincat AP = Syntax.AP ;
lincat RS = Syntax.RS ;
lincat Pron = Syntax.Pron ; IndefPron = Syntax.NP ; IndefTherePron = Syntax.NP ;
lincat Prep = Syntax.Prep ;
lincat S = Syntax.S ; lincat SimpleS = Syntax.S ;
lincat VP = Syntax.VP ;
lincat V = Syntax.V ;
lincat VS = Syntax.VS ;
lincat V2 = Syntax.V2 ;
lincat V3 = Syntax.V3 ;
lincat Adv = Syntax.Adv ;
lincat Conj = Syntax.Conj ;
lincat IP = Syntax.IP ;
lincat IAdv = Syntax.IAdv ;
lincat IDet = Syntax.IDet ;
lincat QS = Syntax.QS ;
lincat Text = Syntax.Text ;
lincat ACEText = Syntax.Text ;
lincat RP = Syntax.RP ;

lincat MCN = Syntax.CN ;
lincat PP = Syntax.Adv ;

lin aNP = Syntax.mkNP a_Art ;
lin theNP = Syntax.mkNP the_Art ;
lin noNP = Syntax.mkNP no_Quant ;
lin everyNP = Syntax.mkNP every_Det ;

lin pnNP = Syntax.mkNP ;

-- [JJC]
lin somebody_IPron = Syntax.somebody_NP ;
lin something_IPron = Syntax.something_NP ;
lin everybody_IPron = Syntax.everybody_NP ;
lin everything_IPron = Syntax.everything_NP ;
lin nobody_IPron = Syntax.nobody_NP ;
lin nothing_IPron = Syntax.nothing_NP ;

-- [JJC]
lin indefTherePronNP pr = pr;
lin indefPronNP pr = pr;
lin indefTherePronVarNP pr var = symb var ; -- Default ignores pronoun! This sould be overridden [JJC]
lin indefPronVarNP pr var = symb var ; -- Default ignores pronoun! This sould be overridden [JJC]

lin at_leastNP ca = Syntax.mkNP (Syntax.mkCard at_least_AdN ca) ;
lin at_mostNP ca = Syntax.mkNP (Syntax.mkCard at_most_AdN ca) ;
lin more_thanNP ca = Syntax.mkNP (Syntax.mkCard (mkAdN more_CAdv) ca) ;
lin less_thanNP ca = Syntax.mkNP (Syntax.mkCard (mkAdN less_CAdv) ca) ;
lin exactlyNP ca = Syntax.mkNP (Syntax.mkCard exactly_AdN ca) ;

-- Predet -> NP -> NP
lin nothing_butNP cn = Syntax.mkNP only_Predet (Syntax.mkNP a_Art plNum cn) ;
-- The previous version (NP -> Adv -> NP) did not require the NP
-- to be plural, i.e. the NP was `nothing' which is singular.
-- lin nothing_butNP cn = Syntax.mkNP Syntax.nothing_NP (mkAdv except_Prep (Syntax.mkNP a_Art plNum cn)) ;

lincat Unit = Syntax.CN ;

lin apposVarCN cn v = mkCN cn (symb v) ;

lin termNP x = symb (ss x.s) ;

-- 2.2.2

lin relCN = mkCN ;
lin relNP = Syntax.mkNP ;
--lin relThereNP = Syntax.mkNP ; [JJC]

lin andRS = mkRS Syntax.and_Conj ;
lin orRS = mkRS Syntax.or_Conj ;

lin predRS rp vp = mkRS (mkRCl rp vp) ;
lin neg_predRS rp vp = mkRS negativePol (mkRCl rp vp) ;
lin slashRS rp np v2 = mkRS (mkRCl rp np v2) ;
lin neg_slashRS rp np v2 = mkRS negativePol (mkRCl rp np v2) ;
lin which_RP = Syntax.which_RP ;

-- 2.2.4

lin ofCN cn np = mkCN cn (mkAdv possess_Prep np) ;

-- 2.3.1

lin vpS np vp = mkS (mkCl np vp) ;
lin neg_vpS np vp = mkS negativePol (mkCl np vp) ;

lin v2VP = mkVP ;

-- 2.3.2 [JJC]

lin a2VP = mkVP ; -- is mad-about NP

-- 3.2

lin thereNP np = mkS (mkCl np) ;

-- ThereNP is just a regular NP, we just need it to separate out
-- the NPs which can occur as arguments of 'there is/are'.
-- I hope the id-function is the right way to implement this.
lin thereNP_as_NP = id Syntax.NP ;

lin cn_as_VarCN = id Syntax.CN ;

lin simpleS_as_S = id Syntax.S ;


-- 3.4.1

lin coordS = mkS ;

lin and_Conj = Syntax.and_Conj ;
lin or_Conj = Syntax.or_Conj ;

-- 3.4.3

lin for_everyS cn = mkS (mkAdv for_Prep (Syntax.mkNP every_Det cn)) ;

-- 3.4.4

lin if_thenS = mkS if_then_Conj ;

lin falseS s = mkS (adj_thatCl false_A s) ;


-- 3.5

lin ipQS ip vp = mkQS (mkQCl ip vp) ;
lin neg_ipQS ip vp = mkQS negativePol (mkQCl ip vp) ;

lin slash_ipQS ip np v2 = mkQS (mkQCl ip (mkClSlash np v2)) ;
lin neg_slash_ipQS ip np v2 = mkQS negativePol (mkQCl ip (mkClSlash np v2)) ;

lin whoSg_IP = Syntax.whoSg_IP ;
lin whatSg_IP = Syntax.whatSg_IP ;

lin whichIP = Syntax.mkIP ;
lin which_IDet = Syntax.which_IDet ;
lin whichPl_IDet = Syntax.whichPl_IDet ;

-- 3.6

lin consText = mkText ;
lin baseText t = t ;
lin sText = mkText ;
lin qsText = mkText ;


--- more

lin npVP = mkVP ;
lin digitsCard n = Syntax.mkCard <lin Digits n : Digits> ;
lin v2_byVP v2 np = mkVP (passiveVP v2) (mkAdv by8agent_Prep np) ;

}
