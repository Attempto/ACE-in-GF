incomplete concrete AttemptoI of Attempto = SymbolsC, Numeral ** open 
  Syntax, 
  Symbolic,
  Prelude,
  LexAttempto 
in {

lincat CN = Syntax.CN ;
lincat NP = Syntax.NP ;
lincat Card = Syntax.Card ;
--lincat Numeral = Syntax.Numeral ;
lincat PN = Syntax.PN ;
lincat A = Syntax.A ;
lincat A2 = Syntax.A2 ;
lincat AP = Syntax.AP ;
lincat RS = Syntax.RS ;
lincat Pron = Syntax.Pron ;
lincat Prep = Syntax.Prep ;
lincat S = Syntax.S ;
lincat VP = Syntax.VP ;
lincat V = Syntax.V ;
lincat VS = Syntax.VS ;
lincat V2 = Syntax.V2 ;
lincat V3 = Syntax.V3 ;
lincat Adv = Syntax.Adv ;
lincat Conj = Syntax.Conj ;
lincat IP = Syntax.IP ;
lincat IAdv = Syntax.IAdv ;
lincat QS = Syntax.QS ;
lincat Text = Syntax.Text ;
lincat ACEText = Syntax.Text ;
lincat RP = Syntax.RP ;

lincat MCN = Syntax.CN ;
lincat PP = Syntax.Adv ;

lin aNP = mkNP a_Art ;
lin theNP = mkNP the_Art ;
lin cardNP d = mkNP d ;
lin noNP = mkNP no_Quant ;
lin everyNP = mkNP every_Det ;
lin notEveryNP cn = mkNP not_Predet (mkNP every_Det cn) ;

lin pnNP = mkNP ;

--lin someone_NP : NP ;
lin somebody_NP = Syntax.somebody_NP ;
lin something_NP = Syntax.something_NP ;
lin everybody_NP = Syntax.everybody_NP ;
lin everything_NP = Syntax.everything_NP ;
--lin noone_NP : NP ;
lin nobody_NP = Syntax.nobody_NP ;
lin nothing_NP = Syntax.nothing_NP ;
--lin not_everyoneNP : NP ;
lin not_everybodyNP = mkNP not_Predet Syntax.everybody_NP ;
lin not_everythingNP = mkNP not_Predet Syntax.everything_NP ;

lin at_leastNP ca = mkNP (mkCard at_least_AdN ca) ;
lin at_mostNP ca = mkNP (mkCard at_most_AdN ca) ;
lin more_thanNP ca = mkNP (mkCard (mkAdN more_CAdv) ca) ;
lin less_thanNP ca = mkNP (mkCard (mkAdN less_CAdv) ca) ;
lin exactlyNP ca = mkNP (mkCard exactly_AdN ca) ;

lin nothing_butNP cn = mkNP nothing_NP (mkAdv except_Prep (mkNP a_Art plNum cn)) ;

lincat Unit = CN ;

lin apposVarCN cn v = mkCN cn (symb v) ;

lin termNP x = symb (ss x.s) ;

-- 2.2.2

lin relCN = mkCN ;
lin relNP = mkNP ;

lin andRS = mkRS and_Conj ;
lin orRS = mkRS or_Conj ;

lin suchCN cn s = mkCN (mkAP (mkAP such_A) s) cn ;

lin predRS rp vp = mkRS (mkRCl rp vp) ;
lin slashRS rp np v2 = mkRS (mkRCl rp np v2) ;
lin which_RP = Syntax.which_RP ;

-- 2.2.4

lin ofCN cn np = mkCN cn (mkAdv possess_Prep np) ;

-- 2.3.1

lin vpS np vp = mkS (mkCl np vp) ;
lin neg_vpS np vp = mkS negativePol (mkCl np vp) ;

lin v2VP = mkVP ;

-- 3.2

lin thereNP np = mkS (mkCl np) ;


-- 3.4.1

lin coordS = mkS ;

lin and_Conj = Syntax.and_Conj ;
lin or_Conj = Syntax.or_Conj ;

-- 3.4.3

lin for_everyS cn = mkS (mkAdv for_Prep (mkNP every_Det cn)) ;

-- 3.4.4

lin if_thenS = mkS if_then_Conj ;

lin falseS s = mkS (adj_thatCl false_A s) ;


-- 3.5

--lin npQS np vp = mkQS (mkCl np vp) ;
lin ipQS ip vp = mkQS (mkQCl ip vp) ;

lin whoSg_IP = Syntax.whoSg_IP ;

-- 3.6

lin consText = mkText ;
lin baseText t = t ;
lin sText = mkText ;
lin qsText = mkText ;


--- more

lin npVP = mkVP ;
lin digitsCard n = mkCard <lin Digits n : Digits> ;
lin v2_byVP v2 np = mkVP (passiveVP v2) (mkAdv by8agent_Prep np) ;

}
