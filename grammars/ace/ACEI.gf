incomplete concrete ACEI of ACE = AttemptoI, SymbolsACEC, Numeral ** open
  Syntax,
  Symbolic,
  Prelude,
  LexACE
in {

-- Categories that full ACE adds on top of the AceWiki subset
--lincat A = Syntax.A ;
lincat AP = Syntax.AP ;
lincat Prep = Syntax.Prep ;
lincat VS = Syntax.VS ;
lincat V3 = Syntax.V3 ;
lincat Adv = Syntax.Adv ;
lincat IAdv = Syntax.IAdv ;

lin cardNP d = Syntax.mkNP d ;

lin eachNP = mkNP each_Det ;
lin notEveryNP cn = mkNP not_Predet (mkNP every_Det cn) ;
lin notEachNP cn = mkNP not_Predet (mkNP each_Det cn) ;
lin theCollNP = mkNP the_Art plNum ;
lin someCollNP = mkNP somePl_Det ;
lin allCollNP cn = mkNP all_Predet (mkNP a_Art plNum cn) ;

lin noCollNP = mkNP no_Quant plNum ;
lin eachTheNP cn = eachOf (mkNP the_Art plNum cn) ;
lin eachSomeNP cn = eachOf (mkNP somePl_Det cn) ;
lin eachNumNP ca cn = eachOf (mkNP ca cn) ;

lin someMassNP = mkNP someSg_Det ;
lin allMassNP cn = mkNP all_Predet (mkNP cn) ;

lin noMassNP = mkNP no_Quant ;
lin notAllMassNP cn = mkNP not_Predet (mkNP all_Predet (mkNP cn)) ;

---lin one_Card = mkCard n1_Numeral ;
---lin two_Card = mkCard n2_Numeral ;
---lin five_Card = mkCard n5_Numeral ;
---lin ten_Card = mkCard n10_Numeral ;

lin intNP = symb ;
lin floatNP = symb ;

lin it_NP = mkNP it_Pron ;
lin he_NP = mkNP he_Pron ;
lin she_NP = mkNP she_Pron ;
lin he_she_NP = mkNP slash_Conj (mkNP he_Pron) (mkNP she_Pron) ;
lin they_NP = mkNP they_Pron ;

lin conjNP = mkNP and_Conj ;
lin adjCN = mkCN ;

--lin someone_IPron : Syntax.someone_NP ;
--lin noone_IPron : Syntax.noone_NP ;

--lin not_everyoneNP : NP ;
lin not_everybodyNP = mkNP not_Predet Syntax.everybody_NP ;
lin not_everythingNP = mkNP not_Predet Syntax.everything_NP ;

lin nothing_butMassNP cn = mkNP nothing_NP (mkAdv except_Prep (mkNP cn)) ;
lin nobody_butNP pn = mkNP nobody_NP (mkAdv except_Prep (mkNP pn)) ;
lin no_butNP cn pn = mkNP (mkNP no_Quant plNum cn) (mkAdv except_Prep (mkNP pn)) ;

lin unitNP = mkNP ;
lin unit_ofNP ca u cn = mkNP (mkNP ca u) (mkAdv part_Prep (mkNP a_Art plNum cn)) ;
lin unit_ofMassNP ca u cn = mkNP (mkNP ca u) (mkAdv part_Prep (mkNP cn)) ;

-- 2.2.1


lin adjCN = mkCN ;
lin positAP = mkAP ;
lin comparAP = Syntax.comparAP ;
lin superlAP a = mkAP (mkOrd a) ;


-- 2.2.2

lin eachRP = mkRP part_Prep (mkNP each_Det) Syntax.which_RP ;

-- 2.2.4

lin genNP = genitiveNP ;
lin genOwnNP np cn = genitiveNP np (mkCN own_A cn) ;

-- 2.3.1

lin not_provably_vpS np vp = mkS negativePol (mkCl np (mkVP vp provably_Adv)) ;

lin vVP  = mkVP ;
lin vsVP = mkVP ;
lin v3VP = mkVP ;

-- 2.3.2

lin apVP = mkVP ;
lin compVP a np = mkVP (mkAP a np) ;
lin as_asVP ap np = mkVP (mkAP as_CAdv ap np) ; -- John is as rich as Mary
lin more_thanVP ap np = mkVP (mkAP more_CAdv ap np) ;

---- John is as fond-of Mary as of Sue
---- John is more fond-of Mary than of Sue

--lincat [PP] = Adv ;

--lin BasePP p = p ;

lin ppVP = mkVP ;

lin prepPP = mkAdv ;
lin advPP p = p ;

-- 2.3.5

lin canVP = mkVP can_VV ;
lin mustVP = mkVP must_VV ;

lin have_toVP = mkVP have_VV ;

-- 2.4

lin modVP = mkVP ;

-- 3.3

lin formulaS f = symb (ss f.s) ;

-- 3.4.1

lin commaAnd_Conj = comma_and_Conj ;
lin commaOr_Conj = comma_or_Conj ;

-- 3.4.3

lin for_eachS cn = mkS (mkAdv for_Prep (mkNP each_Det cn)) ;
lin for_each_ofS card cn =
  mkS (mkAdv for_Prep (eachOf (mkNP card cn))) ;
lin for_allMassS cn =
  mkS (mkAdv for_Prep (mkNP all_Predet (mkNP cn))) ;

-- 3.4.4

lin not_provableS s = mkS negativePol (adj_thatCl provable_A s) ;
lin possibleS s = mkS (adj_thatCl possible_A s) ;
lin not_possibleS s = mkS negativePol (adj_thatCl possible_A s) ;
lin necessaryS s = mkS (adj_thatCl necessary_A s) ;
lin not_necessaryS s = mkS negativePol (adj_thatCl necessary_A s) ;


-- 3.5

lin npQS np vp = mkQS (mkCl np vp) ;
lin iadvQS iadv np vp = mkQS (mkQCl iadv (mkCl np vp)) ;

lin where_IAdv = Syntax.where_IAdv ;
lin when_IAdv = Syntax.when_IAdv ;
lin whoPl_IP = Syntax.whoPl_IP ;

lin there_ipQS ip = mkQS (mkQCl ip) ; ---- who is there, not there is who
lin whoseIP = mkIP whose_IDet ;

-- 3.6

lin np_impVP np vp = mkText (mkPhr (mkUtt (mkImp vp)) (mkVoc np)) exclMarkPunct ;
        ---- John, go to the bank!


lin impVP vp = mkText (mkImp vp) ;
lin numeralCard n = mkCard <lin Numeral n : Numeral> ;
lin have_V2 = Syntax.have_V2 ;

}
