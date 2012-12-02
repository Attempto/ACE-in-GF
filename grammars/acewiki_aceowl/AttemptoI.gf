incomplete concrete AttemptoI of Attempto = SymbolsC, Numeral ** open
  Syntax,
  Symbolic,
  Prelude,
  LexAttempto,
  Extra
in {

lincat CN = Syntax.CN ; VarCN = Syntax.CN ;
lincat NP = Syntax.NP ;
lincat NPType = Str ;
lincat Card = Syntax.Card ;
lincat PN = Syntax.PN ;
lincat A = Syntax.A ;
lincat A2 = Syntax.A2 ;
lincat RS = Syntax.RS ;
lincat Pron = Syntax.Pron ; IndefPron = Syntax.NP ;
lincat S = Syntax.S ; lincat SimpleS = Syntax.S ;
lincat VP = Syntax.VP ;
lincat V = Syntax.V ;
lincat V2 = Syntax.V2 ;
lincat Conj = Syntax.Conj ;
lincat IP = Syntax.IP ;
lincat IDet = Syntax.IDet ;
lincat QS = Syntax.QS ;
lincat Text = Syntax.Text ;
lincat ACEText = Syntax.Text ;
lincat RP = Syntax.RP ;

lincat MCN = Syntax.CN ;
lincat PP = Syntax.Adv ;

-- TODO: is this the right way to do it?
lin exist_plus = "exist_plus";
lin exist_minus = "exist_minus";

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
lin indefPronNP _ pr = pr;
lin indefPronVarNP _ pr var = symb var ; -- Default ignores pronoun! This sould be overridden [JJC]

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

lin termNP _ x = symb (Prelude.ss x.s) ;

lin relCN = mkCN ;
lin relNP _ = Syntax.mkNP ;
--lin relThereNP = Syntax.mkNP ; [JJC]

lin andRS = mkRS Syntax.and_Conj ;
lin orRS = mkRS Syntax.or_Conj ;

lin predRS rp vp = mkRS (mkRCl rp vp) ;
lin neg_predRS rp vp = mkRS negativePol (mkRCl rp vp) ;
lin slashRS _ rp np v2 = mkRS (mkRCl rp np v2) ;
lin neg_slashRS _ rp np v2 = mkRS negativePol (mkRCl rp np v2) ;
lin which_RP = Syntax.which_RP ;

lin ofCN _ cn np = mkCN cn (Syntax.mkAdv possess_Prep np) ;

lin vpS _ np vp = mkS (mkCl np vp) ;
lin neg_vpS _ np vp = mkS negativePol (mkCl np vp) ;

lin v2VP _ = mkVP ;

lin a2VP _ = mkVP ; -- is mad-about NP

lin thereNP np = mkS (mkCl np) ;

-- ThereNP is just a regular NP, we just need it to separate out
-- the NPs which can occur as arguments of 'there is/are'.
-- I hope the id-function is the right way to implement this.
lin thereNP_as_NP = id Syntax.NP ;

lin cn_as_VarCN = id Syntax.CN ;

lin simpleS_as_S = id Syntax.S ;


lin coordS = mkS ;

lin and_Conj = Syntax.and_Conj ;
lin or_Conj = Syntax.or_Conj ;

lin for_everyS cn = mkS (Syntax.mkAdv for_Prep (Syntax.mkNP every_Det cn)) ;

lin if_thenS = mkS if_then_Conj ;

lin falseS s = mkS (adj_thatCl false_A s) ;


-- lin ipQS ip vp = mkQS (mkQCl ip vp) ;
-- lin neg_ipQS ip vp = mkQS negativePol (mkQCl ip vp) ;

lin slash_ipQS _ ip np v2 = mkQS (mkQCl ip (mkClSlash np v2)) ;
lin neg_slash_ipQS _ ip np v2 = mkQS negativePol (mkQCl ip (mkClSlash np v2)) ;

lin whoSg_IP = Syntax.whoSg_IP ;
lin whatSg_IP = Syntax.whatSg_IP ;

lin whichIP = Syntax.mkIP ;
lin which_IDet = Syntax.which_IDet ;
lin whichPl_IDet = Syntax.whichPl_IDet ;

lin consText = mkText ;
lin baseText t = t ;
lin sText = mkText ;
lin qsText = mkText ;


lin npVP _ = mkVP ;
lin digitsCard n = Syntax.mkCard <lin Digits n : Digits> ;
lin v2_byVP _ v2 np = mkVP (passiveVP v2) (Syntax.mkAdv by8agent_Prep np) ;


-- Question-related functions to handle wh-words in object positions
-- Ideally everything in this section would be placed in another incomplete module QuestionsI
-- but I can't that working, so they are here.

  lincat
    VarCNQ = Syntax.CN ;
    NPQ = Syntax.NP ;
    VPQ = Syntax.VP ;
    RSQ = Syntax.RS ;

  -- This oper must be implemented in all languages
  -- oper S2QS : Syntax.S -> Syntax.QS ;

  -- TODO: vpS requires one extra argument, how to specify it?
  -- lin vpqQS _ np vpq = S2QS (vpS np vpq) ;
  -- TODO: neg_vpS requires one extra argument, how?
  -- lin neg_vpqQS _ np vpq = S2QS (neg_vpS np vpq) ;
  lin npqQS _ npq vp = S2QS (mkS (mkCl npq vp)) ;
  lin neg_npqQS _ npq vp = S2QS (mkS negativePol (mkCl npq vp)) ;

  lin npqVPQ = npVP ;
  lin v2VPQ = v2VP ;
  lin a2VPQ = a2VP ;
  lin v2_byVPQ = v2_byVP ;

  lin vp_as_posVPSQ = vp_as_posVPS ;
  lin vp_as_negVPSQ = vp_as_negVPS ;
  lin vpq_as_posVPSQ = vp_as_posVPS ;
  lin vpq_as_negVPSQ = vp_as_negVPS ;

  -- TODO: np_coord_VPS requires one extra argument, how?
  -- lin np_coord_VPSQ _ np conj vpsqs = S2QS ( np_coord_VPS np conj vpsqs ) ;
  -- lin npq_coord_VPS _ npq conj vpss = S2QS ( np_coord_VPS npq conj vpss ) ;

  lin ofnpqCN = ofCN ;
  lin aNPQ _ = aNP ;
  lin theNPQ _ = theNP ;
  lin noNPQ _ = noNP ;
  lin everyNPQ _ = everyNP ;

  -- This function is language-specific
  -- lin ipNPQ
  lin relNPQ = relNP ;

  lin predRSQ = predRS ;
  lin neg_predRSQ = neg_predRS ;
  lin slashRSQ = slashRS ;
  lin neg_slashRSQ = neg_slashRS ;

  lincat
    VPS = Extra.VPS ;
    [VPS] = Extra.ListVPS ;
  lin
    BaseVPS = Extra.BaseVPS ;
    ConsVPS = Extra.ConsVPS ;
    vp_as_posVPS = Extra.MkVPS (mkTemp presentTense simultaneousAnt) positivePol ;
    vp_as_negVPS = Extra.MkVPS (mkTemp presentTense simultaneousAnt) negativePol ;
    np_coord_VPS _ np conj vpss = Extra.PredVPS np (Extra.ConjVPS conj vpss);

  lincat VPSQ = Extra.VPS ;
  lincat [VPSQ] = Extra.ListVPS ;
  lin BaseVPSQ = Extra.BaseVPS ;
  lin ConsVPSQ = Extra.ConsVPS ;

}
