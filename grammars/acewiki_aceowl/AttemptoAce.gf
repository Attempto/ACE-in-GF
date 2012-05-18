--# -path=.:present

concrete AttemptoAce of Attempto = SymbolsC [Term], NumeralAce **
  AttemptoI - [NP, VP, ThereNP, aNP, theNP, noNP, everyNP, pnNP,
                 indefTherePronNP, indefPronNP, indefTherePronVarNP, indefPronVarNP, at_leastNP, at_mostNP, more_thanNP, less_thanNP, exactlyNP,
                 nothing_butNP, termNP, relNP, predRS, neg_predRS, slashRS, neg_slashRS, ofCN, vpS, neg_vpS, v2VP, a2VP, thereNP, thereNP_as_NP,
                 ipQS, neg_ipQS, slash_ipQS, neg_slash_ipQS, npVP, v2_byVP,
                 apposVarCN] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexAttempto = LexAttemptoAce) ** open SyntaxAce, ExtraAce, ResAce, SentenceAce, Precedence in {

  lincat
    -- Supplement NP with a parameter for indicating it is a question
    -- e.g. Direct: a friend of John
    --       Quest: a friend of who
    NP = Syntax.NP ** {o:Order} ;
    ThereNP = Syntax.NP ** {o:Order} ;
    VP = Syntax.VP ** {o:Order} ;

  -- All the functions below deal with having wh-words in object position. [JJC]
  oper
    ip2np : SyntaxAce.IP -> Agr -> SyntaxAce.NP = \ip,agr -> lin NP ( ip ** {a = agr} ) ;
    ssQS : Str -> SyntaxAce.QS = \s -> lin QS {s = \\_ => s} ;

    np2np = overload {
      np2np : AttemptoAce.NP -> SyntaxAce.NP = \np -> np ;
      np2np : SyntaxAce.NP -> Order -> AttemptoAce.NP = \np,ord -> np ** {o=ord} ;
    } ;
    directNP : SyntaxAce.NP -> AttemptoAce.NP = \np -> np ** {o=ODir};
    questNP : SyntaxAce.NP -> AttemptoAce.NP = \np -> np ** {o=OQuest};
    vp2vp = overload {
      vp2vp : AttemptoAce.VP -> SyntaxAce.VP = \vp -> vp ;
      vp2vp : SyntaxAce.VP -> Order -> AttemptoAce.VP = \vp,ord -> vp ** {o=ord} ;
    } ;
    directVP : SyntaxAce.VP -> AttemptoAce.VP = \vp -> vp ** {o=ODir};
    questVP : SyntaxAce.VP -> AttemptoAce.VP = \vp -> vp ** {o=OQuest};

  lin aNP vcn = directNP (Syntax.mkNP a_Art vcn) ;
  lin theNP vcn = directNP (Syntax.mkNP the_Art vcn) ;
  lin noNP vcn = directNP (Syntax.mkNP no_Quant vcn) ;
  lin everyNP vcn = directNP (Syntax.mkNP every_Det vcn) ;

  lin pnNP pn = directNP (Syntax.mkNP pn) ;

  lin indefTherePronNP pr = directNP pr;
  lin indefPronNP pr = directNP pr;
  -- lin indefTherePronVarNP pr var = symb var ; -- Default ignores pronoun! This sould be overridden [JJC]
  -- lin indefPronVarNP pr var = symb var ; -- Default ignores pronoun! This sould be overridden [JJC]

  lin at_leastNP ca vcn = directNP (Syntax.mkNP (Syntax.mkCard at_least_AdN ca) vcn) ;
  lin at_mostNP ca vcn = directNP (Syntax.mkNP (Syntax.mkCard at_most_AdN ca) vcn) ;
  lin more_thanNP ca vcn = directNP (Syntax.mkNP (Syntax.mkCard (mkAdN more_CAdv) ca) vcn) ;
  lin less_thanNP ca vcn = directNP (Syntax.mkNP (Syntax.mkCard (mkAdN less_CAdv) ca) vcn) ;
  lin exactlyNP ca vcn = directNP (Syntax.mkNP (Syntax.mkCard exactly_AdN ca) vcn) ;
  lin nothing_butNP cn = directNP (Syntax.mkNP only_Predet (Syntax.mkNP a_Art plNum cn)) ;

  lin termNP x = directNP (symb (ss x.s)) ;

  lin relNP np rs = np2np (SyntaxAce.mkNP (np2np np) rs) np.o;
  lin predRS rp vp = mkRS (mkRCl rp (vp2vp vp)) ;
  lin neg_predRS rp vp = mkRS negativePol (mkRCl rp (vp2vp vp)) ;
  lin slashRS rp np v2 = mkRS (mkRCl rp (np2np np) v2) ;
  lin neg_slashRS rp np v2 = mkRS negativePol (mkRCl rp (np2np np) v2) ;

  lin ofCN cn np = mkCN cn (mkAdv possess_Prep (np2np np)) ;

  lin vpS np vp = mkS (mkCl (np2np np) (vp2vp vp));
  lin neg_vpS np vp = mkS negativePol (mkCl (np2np np) (vp2vp vp)) ;

  lin v2VP v2 np = vp2vp (mkVP v2 (np2np np)) np.o ;

  lin a2VP a2 np = vp2vp (mkVP a2 (np2np np)) np.o ;

  lin thereNP tnp = mkS (mkCl (np2np tnp)) ;
  lin thereNP_as_NP np = np ;

  lin ipQS ip vp = mkQS (mkQCl ip (vp2vp vp)) ;
  lin neg_ipQS ip vp = mkQS negativePol (mkQCl ip (vp2vp vp)) ;
  lin slash_ipQS ip np v2 = mkQS (mkQCl ip (mkClSlash (np2np np) v2)) ;
  lin neg_slash_ipQS ip np v2 = mkQS negativePol (mkQCl ip (mkClSlash (np2np np) v2)) ;

  lin npVP np = vp2vp (mkVP (np2np np)) np.o ;
  lin v2_byVP v2 np = vp2vp (mkVP (passiveVP v2) (mkAdv by8agent_Prep (np2np np))) np.o ;

{-
    ipNPQ ip = lin NPQ ( ip2np ip (agrP3 Sg) ) ; -- Is agrP3 Sg suitable for all cases..? [JJC]
    ofNPQ np ip = lin NPQ ( SyntaxAce.mkNP np (mkAdv possess_Prep (ip2np ip (agrP3 Sg))) ) ;
    is_ThereNPQ somebody who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (predRS AttemptoAce.which_RP (npVP (ip2np who somebody.a))) ; -- "somebody who is who"
    v2_ThereNPQ somebody v2 who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (predRS AttemptoAce.which_RP (v2VP v2 (ip2np who somebody.a))) ; -- "somebody who asks who"
    a2_ThereNPQ somebody a2 who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (predRS AttemptoAce.which_RP (a2VP a2 (ip2np who somebody.a))) ; -- "somebody who is mad-about who"
    neg_is_ThereNPQ somebody who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (neg_predRS AttemptoAce.which_RP (npVP (ip2np who somebody.a))) ; -- "somebody who is not who"
    neg_v2_ThereNPQ somebody v2 who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (neg_predRS AttemptoAce.which_RP (v2VP v2 (ip2np who somebody.a))) ; -- "somebody who does not ask who"
    neg_a2_ThereNPQ somebody a2 who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (neg_predRS AttemptoAce.which_RP (a2VP a2 (ip2np who somebody.a))) ; -- "somebody who is not mad-about who"

    is_npq_QS np npq = ssQS ((mkCl np npq).s ! Pres ! Simul ! CPos ! ODir) ; -- "Mary is who ?"
    v2_npq_QS np v2 npq = ssQS ((mkCl np v2 npq).s ! Pres ! Simul ! CPos ! ODir) ; -- "Mary asks who ?"
    v2passive_npq_QS np v2 npq = ssQS ((mkCl np (v2_byVP v2 npq)).s ! Pres ! Simul ! CPos ! ODir) ; -- "Mary is asked by who ?"
    a2_npq_QS np a2 npq = ssQS ((mkCl np a2 npq).s ! Pres ! Simul ! CPos ! ODir) ; -- "Mary is mad-about who ?"
    neg_is_npq_QS np npq = ssQS ((mkCl np npq).s ! Pres ! Simul ! CNeg (True|False) ! ODir) ; -- "Mary is not who ?"
    neg_v2_npq_QS np v2 npq = ssQS ((mkCl np v2 npq).s ! Pres ! Simul ! CNeg (True|False) ! ODir) ; -- "Mary does not ask who ?"
    neg_v2passive_npq_QS np v2 npq = ssQS ((mkCl np (v2_byVP v2 npq)).s ! Pres ! Simul ! CNeg (True|False) ! ODir) ; -- "Mary is not asked by who ?"
    neg_a2_npq_QS np a2 npq = ssQS ((mkCl np a2 npq).s ! Pres ! Simul ! CNeg (True|False) ! ODir) ; -- "Mary is not mad-about who ?"

    qs_and_VP qs vp = ssQS s where {
      vps = ExtraAce.MkVPS (mkTemp presentTense simultaneousAnt) positivePol vp ;
      s:Str = (mkS SyntaxAce.and_Conj (lin S (ss (qs.s ! QDir))) (lin S (ss (vps.s ! agrP3 Sg)))).s ;
    } ;
    qs_and_negVP qs vp = ssQS s where {
      vps = ExtraAce.MkVPS (mkTemp presentTense simultaneousAnt) AnyNeg vp ;
      s:Str = (mkS SyntaxAce.and_Conj (lin S (ss (qs.s ! QDir))) (lin S (ss (vps.s ! agrP3 Sg)))).s ;
    } ;
  -- end of wh-word object pos stuff
-}
  -- Variables have genitives [JJC]
  lincat Var = {s : Case => Str};
  lin var_Term v = mkpConst (NomVar v) ;
  lin X_Var = {s = regGenitiveS "X"} ;
  lin Y_Var = {s = regGenitiveS "Y"} ;
  oper NomVar : {s : Case => Str} -> Str = \v -> v.s ! Nom ;

  -- "everybody X" etc [JJC]
  lin indefPronVarNP pr v = lin NP {
    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case c) ; -- with genitive "somebody X's"
--    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case (NCase Nom)) ; -- no inflection for genitive
    a = pr.a ;
    o = ODir
  };

  -- "somebody X" and "something X" [KK]
  lin indefTherePronVarNP pr v = lin NP {
    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case c) ; -- with genitive "somebody X's"
    a = pr.a ;
    o = ODir
  };

  -- We override this because of the linearisation of Var [JJC]
  lin apposVarCN cn v = mkCN cn (symb (NomVar v)) ;

  -- VP coordination
  lincat
    VPS = ExtraAce.VPS ;
    [VPS] = ExtraAce.ListVPS ;
  lin
    BaseVPS = ExtraAce.BaseVPS ;
    ConsVPS = ExtraAce.ConsVPS ;
    vp_as_posVPS = MkVPS (mkTemp presentTense simultaneousAnt) positivePol ;
    vp_as_negVPS = MkVPS (mkTemp presentTense simultaneousAnt) AnyNeg ;
    np_coord_VPS np conj vpss = ExtraAce.PredVPS np (ExtraAce.ConjVPS conj vpss);

}
