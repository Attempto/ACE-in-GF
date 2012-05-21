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
    S2QS : SyntaxAce.S -> SyntaxAce.QS = \s -> lin QS {s = \\_ => s.s} ;

  lin vpqQS np vpq = S2QS (vpS np vpq) ;
  lin neg_vpqQS np vpq = S2QS (neg_vpS np vpq) ;
  lin npqQS npq vp = S2QS (mkS (mkCl npq vp)) ;
  lin neg_npqQS npq vp = S2QS (mkS negativePol (mkCl npq vp)) ;

  lin npqVPQ = npVP ;
  lin v2VPQ = v2VP ;
  lin a2VPQ = a2VP ;
  lin v2_byVPQ = v2_byVP ;

  lincat VPSQ = ExtraAce.VPS ;
  lincat [VPSQ] = ExtraAce.ListVPS ;
  lin BaseVPSQ = ExtraAce.BaseVPS ;
  lin ConsVPSQ = ExtraAce.ConsVPS ;
  lin vp_as_posVPSQ = vp_as_posVPS ;
  lin vp_as_negVPSQ = vp_as_negVPS ;
  lin vpq_as_posVPSQ = vp_as_posVPS ;
  lin vpq_as_negVPSQ = vp_as_negVPS ;

  lin np_coord_VPSQ np conj vpsqs = S2QS ( np_coord_VPS np conj vpsqs ) ;
  lin npq_coord_VPS npq conj vpss = S2QS ( np_coord_VPS npq conj vpss ) ;

  lin ofnpqCN cn np = mkCN cn (mkAdv possess_Prep np) ;
  lin aNPQ = aNP ;
  lin theNPQ = theNP ;
  lin noNPQ = noNP ;
  lin everyNPQ = everyNP ;

  lin ipNPQ ip = lin NPQ ( ip2np ip (agrP3 (Sg|Pl)) ) ; -- TODO this variant is probably very naughty
  lin relNPQ = relNP ;

  lin predRSQ = predRS ;
  lin neg_predRSQ = neg_predRS ;
  lin slashRSQ = slashRS ;
  lin neg_slashRSQ = neg_slashRS ;

}
