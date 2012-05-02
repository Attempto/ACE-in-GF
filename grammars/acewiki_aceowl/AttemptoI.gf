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
lincat Pron = Syntax.Pron ; lincat IndefPron = Syntax.Pron ;
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
lincat IDet = Syntax.IDet ;
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

lin pnNP = mkNP ;

-- [JJC]
oper NPtoPron : Syntax.NP -> Syntax.Pron = \np -> lin Pron ( np ** { sp = \\c => "TODO"} );
lin somebody_IPron = NPtoPron Syntax.somebody_NP ;
lin something_IPron = NPtoPron Syntax.something_NP ;
lin everybody_IPron = NPtoPron Syntax.everybody_NP ;
lin everything_IPron = NPtoPron Syntax.everything_NP ;
lin nobody_IPron = NPtoPron Syntax.nobody_NP ;
lin nothing_IPron = NPtoPron Syntax.nothing_NP ;

-- [JJC]
lin indefPronNP pr = lin NP ( pr );
lin indefPronVarNP pr v = lin NP {
       s = \\c => pr.s ! c ++ v.s ;
       a = pr.a
};

lin at_leastNP ca = mkNP (mkCard at_least_AdN ca) ;
lin at_mostNP ca = mkNP (mkCard at_most_AdN ca) ;
lin more_thanNP ca = mkNP (mkCard (mkAdN more_CAdv) ca) ;
lin less_thanNP ca = mkNP (mkCard (mkAdN less_CAdv) ca) ;
lin exactlyNP ca = mkNP (mkCard exactly_AdN ca) ;

lin nothing_butNP cn = mkNP Syntax.nothing_NP (mkAdv except_Prep (mkNP a_Art plNum cn)) ;

lincat Unit = Syntax.CN ;

lin apposVarCN cn v = mkCN cn (symb v) ;

lin termNP x = symb (ss x.s) ;

-- 2.2.2

lin relCN = mkCN ;
lin relNP = mkNP ;

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

lin vVP = mkVP ; -- John waits [JJC]

-- 2.3.2 [JJC]

lin aVP = mkVP ; -- is happy
lin a2VP = mkVP ; -- is mad-about NP

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

lin ipQS ip vp = mkQS (mkQCl ip vp) ;
lin neg_ipQS ip vp = mkQS negativePol (mkQCl ip vp) ;

lin slash_ipQS ip np v2 = mkQS (mkQCl ip (mkClSlash np v2)) ;
lin neg_slash_ipQS ip np v2 = mkQS negativePol (mkQCl ip (mkClSlash np v2)) ;

lin whoSg_IP = Syntax.whoSg_IP ;
lin whatSg_IP = Syntax.whatSg_IP ;

lin whichIP = mkIP ;
lin which_IDet = Syntax.which_IDet ;
lin whichPl_IDet = Syntax.whichPl_IDet ;

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
