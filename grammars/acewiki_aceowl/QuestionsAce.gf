--# -path=.:present

incomplete concrete QuestionsAce of Attempto = 
  open SyntaxAce, ResAce, Prelude in {

  lincat
    VarCNQ = SyntaxAce.CN ;
    NPQ = SyntaxAce.NP ;
    VPQ = SyntaxAce.VP ;
    RSQ = SyntaxAce.RS ;

  oper
    ip2np : SyntaxAce.IP -> Agr -> SyntaxAce.NP = \ip,agr -> lin NP ( ip ** {a = agr} ) ;
    ssQS : Str -> SyntaxAce.QS = \s -> lin QS {s = \\_ => s} ;
    Cl2QS : Cl -> SyntaxAce.QS = \cl -> lin QS {s = \\_ => cl.s ! Pres ! Simul ! CPos ! ODir} ;
    Cl2QS_neg : Cl -> SyntaxAce.QS = \cl -> lin QS {s = \\_ => cl.s ! Pres ! Simul ! CNeg (True|False) ! ODir} ;

    -- npq2np : NPQ -> NP = \npq -> lin NP npq ;
    -- np2npq : NP -> NPQ = \np -> lin NPQ np ;
    -- vpq2vp : VPQ -> SyntaxAce.VP = \vpq -> lin VP vpq ;
    -- vp2vpq : SyntaxAce.VP -> VPQ = \vp -> lin VPQ vp ;

  lin vpqQS np vpq = Cl2QS (mkCl np vpq) ;
  lin neg_vpqQS np vpq = Cl2QS_neg (mkCl np vpq) ;

  lin npqVPQ = mkVP ;
  lin v2VPQ = mkVP ;
  lin a2VPQ = mkVP ;
  lin v2_byVPQ v2 np = mkVP (passiveVP v2) (mkAdv by8agent_Prep np) ;

  lin ofnpqCN cn np = mkCN cn (mkAdv possess_Prep np) ;
  lin aNPQ = Syntax.mkNP a_Art ;
  lin theNPQ = Syntax.mkNP the_Art ;
  lin noNPQ = Syntax.mkNP no_Quant ;
  lin everyNPQ = Syntax.mkNP every_Det ;

  lin ipNPQ ip = lin NPQ ( ip2np ip (agrP3 Sg) ) ; -- Is agrP3 Sg suitable for all cases..? [JJC]
  lin relNPQ = Syntax.mkNP ;

  lin predRSQ rp vp = mkRS (mkRCl rp vp) ;
  lin neg_predRSQ rp vp = mkRS negativePol (mkRCl rp vp) ;

--  lin
    -- ofNPQ np ip = lin NPQ ( SyntaxAce.mkNP np (mkAdv possess_Prep (ip2np ip (agrP3 Sg))) ) ;
    -- is_ThereNPQ somebody who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (predRS AttemptoAce.which_RP (npVP (ip2np who somebody.a))) ; -- "somebody who is who"
    -- v2_ThereNPQ somebody v2 who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (predRS AttemptoAce.which_RP (v2VP v2 (ip2np who somebody.a))) ; -- "somebody who asks who"
    -- a2_ThereNPQ somebody a2 who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (predRS AttemptoAce.which_RP (a2VP a2 (ip2np who somebody.a))) ; -- "somebody who is mad-about who"
    -- neg_is_ThereNPQ somebody who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (neg_predRS AttemptoAce.which_RP (npVP (ip2np who somebody.a))) ; -- "somebody who is not who"
    -- neg_v2_ThereNPQ somebody v2 who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (neg_predRS AttemptoAce.which_RP (v2VP v2 (ip2np who somebody.a))) ; -- "somebody who does not ask who"
    -- neg_a2_ThereNPQ somebody a2 who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (neg_predRS AttemptoAce.which_RP (a2VP a2 (ip2np who somebody.a))) ; -- "somebody who is not mad-about who"

    -- neg_is_npq_QS np npq = ssQS ((mkCl np npq).s ! Pres ! Simul ! CNeg (True|False) ! ODir) ; -- "Mary is not who ?"
    -- neg_v2_npq_QS np v2 npq = ssQS ((mkCl np v2 npq).s ! Pres ! Simul ! CNeg (True|False) ! ODir) ; -- "Mary does not ask who ?"
    -- neg_v2passive_npq_QS np v2 npq = ssQS ((mkCl np (v2_byVP v2 npq)).s ! Pres ! Simul ! CNeg (True|False) ! ODir) ; -- "Mary is not asked by who ?"
    -- neg_a2_npq_QS np a2 npq = ssQS ((mkCl np a2 npq).s ! Pres ! Simul ! CNeg (True|False) ! ODir) ; -- "Mary is not mad-about who ?"

    -- qs_and_VP qs vp = ssQS s where {
    --   vps = ExtraAce.MkVPS (mkTemp presentTense simultaneousAnt) positivePol vp ;
    --   s:Str = (mkS SyntaxAce.and_Conj (lin S (ss (qs.s ! QDir))) (lin S (ss (vps.s ! agrP3 Sg)))).s ;
    -- } ;
    -- qs_and_negVP qs vp = ssQS s where {
    --   vps = ExtraAce.MkVPS (mkTemp presentTense simultaneousAnt) AnyNeg vp ;
    --   s:Str = (mkS SyntaxAce.and_Conj (lin S (ss (qs.s ! QDir))) (lin S (ss (vps.s ! agrP3 Sg)))).s ;
    -- } ;

}
