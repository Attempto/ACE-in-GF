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
  lin npqQS npq vp = Cl2QS (mkCl npq vp) ;
  lin neg_npqQS npq vp = Cl2QS_neg (mkCl npq vp) ;

  lin npqVPQ = mkVP ;
  lin v2VPQ v2 npq = mkVP v2 npq ;
  lin a2VPQ = mkVP ;
  lin v2_byVPQ v2 np = mkVP (passiveVP v2) (mkAdv by8agent_Prep np) ;

  lin ofnpqCN cn np = mkCN cn (mkAdv possess_Prep np) ;
  lin aNPQ = Syntax.mkNP a_Art ;
  lin theNPQ = Syntax.mkNP the_Art ;
  lin noNPQ = Syntax.mkNP no_Quant ;
  lin everyNPQ = Syntax.mkNP every_Det ;

  lin ipNPQ ip = lin NPQ ( ip2np ip (agrP3 (Sg|Pl)) ) ; -- TODO this variant is probably very naughty
  lin relNPQ = Syntax.mkNP ;

  lin predRSQ rp vp = mkRS (mkRCl rp vp) ;
  lin neg_predRSQ rp vp = mkRS negativePol (mkRCl rp vp) ;

--  lin

    -- qs_and_VP qs vp = ssQS s where {
    --   vps = ExtraAce.MkVPS (mkTemp presentTense simultaneousAnt) positivePol vp ;
    --   s:Str = (mkS SyntaxAce.and_Conj (lin S (ss (qs.s ! QDir))) (lin S (ss (vps.s ! agrP3 Sg)))).s ;
    -- } ;
    -- qs_and_negVP qs vp = ssQS s where {
    --   vps = ExtraAce.MkVPS (mkTemp presentTense simultaneousAnt) AnyNeg vp ;
    --   s:Str = (mkS SyntaxAce.and_Conj (lin S (ss (qs.s ! QDir))) (lin S (ss (vps.s ! agrP3 Sg)))).s ;
    -- } ;

}
