--# -path=.:present

incomplete concrete QuestionsAce of Attempto = 
  open SyntaxAce, ResAce, ExtraAce, Prelude in {

  oper S2QS s = lin QS {s = \\_ => s.s} ;

  lin vpqQS np vpq = S2QS (vpS np vpq) ;
  lin neg_vpqQS np vpq = S2QS (neg_vpS np vpq) ;
  lin npqQS npq vp = S2QS (mkS (mkCl npq vp)) ;
  lin neg_npqQS npq vp = S2QS (mkS negativePol (mkCl npq vp)) ;

  lincat VPSQ = ExtraAce.VPS ;
  lincat [VPSQ] = ExtraAce.ListVPS ;
  lin BaseVPSQ = ExtraAce.BaseVPS ;
  lin ConsVPSQ = ExtraAce.ConsVPS ;

  lin np_coord_VPSQ np conj vpsqs = S2QS ( np_coord_VPS np conj vpsqs ) ;
  lin npq_coord_VPS npq conj vpss = S2QS ( np_coord_VPS npq conj vpss ) ;

  lin ipNPQ ip = lin NPQ ( (lin NP ip) ** {a = agrP3 (Sg|Pl)} ) ; -- TODO this variant is probably very naughty
  lin relNPQ = relNP ;

}
