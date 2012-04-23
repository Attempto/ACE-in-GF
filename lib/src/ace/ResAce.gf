--# -path=.:../abstract:../common:../../prelude

resource ResAce = ResEng - [posneg, doesnt, auxBe, predV] ** open Prelude in {

  oper

  -- Does this help with are not/aren't? [JJC]
  posneg : Polarity -> Str -> Str = \p,s -> case p of {
    Pos => s ;
    Neg => (s + "n't") | (s ++ "not") -- Eng: s + "n't"
    } ;

  -- In ACE, does and doesn't are equivalent [JJC]
  doesnt = agrVerb ("does not"|"doesn't") ("do not"|"don't") ; -- Eng: agrVerb "doesn't" "don't"

  -- These are exact copies from ResEng, but they need to use our redefinitions above [JJC]
  auxBe : Aux = {
    pres = \\b,a => case <b,a> of {
      <Pos,AgP1 Sg> => "am" ; 
      <Neg,AgP1 Sg> => ["am not"] ; --- am not I
      _ => agrVerb (posneg b "is")  (posneg b "are") a
      } ;
    past = \\b,a => case a of {          --# notpresent
      AgP1 Sg | AgP3Sg _ => posneg b "was" ; --# notpresent
      _                  => (posneg b "were")  --# notpresent
      } ; --# notpresent
    inf  = "be" ;
    ppart = "been" ;
    prpart = "being"
    } ;

  predV : Verb -> VP = \verb -> {
    s = \\t,ant,b,ord,agr => 
      let
        inf  = verb.s ! VInf ;
        fin  = presVerb verb agr ;
        part = verb.s ! VPPart ;
      in
      case <t,ant,b,ord> of {
        <Pres,Simul,CPos,ODir>   => vff            fin [] ;
        <Pres,Simul,CPos,OQuest> => vf (does agr)   inf ;
        <Pres,Anter,CPos,_>      => vf (have agr)   part ; --# notpresent
        <Pres,Anter,CNeg c,_>    => vfn c (have agr) (havent agr) part ; --# notpresent
        <Past,Simul,CPos,ODir>   => vff (verb.s ! VPast) [] ; --# notpresent
        <Past,Simul,CPos,OQuest> => vf "did"        inf ; --# notpresent
        <Past,Simul,CNeg c,_>    => vfn c "did" "didn't"     inf ; --# notpresent
        <Past,Anter,CPos,_>      => vf "had"        part ; --# notpresent
        <Past,Anter,CNeg c,_>    => vfn c "had" "hadn't"     part ; --# notpresent
        <Fut, Simul,CPos,_>      => vf "will"       inf ; --# notpresent
        <Fut, Simul,CNeg c,_>    => vfn c "will" "won't"      inf ; --# notpresent
        <Fut, Anter,CPos,_>      => vf "will"       ("have" ++ part) ; --# notpresent
        <Fut, Anter,CNeg c,_>    => vfn c "will" "won't"("have" ++ part) ; --# notpresent
        <Cond,Simul,CPos,_>      => vf "would"      inf ; --# notpresent
        <Cond,Simul,CNeg c,_>    => vfn c "would" "wouldn't"   inf ; --# notpresent
        <Cond,Anter,CPos,_>      => vf "would"      ("have" ++ part) ; --# notpresent
        <Cond,Anter,CNeg c,_> => vfn c "would" "wouldn't" ("have" ++ part) ; --# notpresent
        <Pres,Simul,CNeg c,_>    => vfn c (does agr) (doesnt agr) inf
        } ;
    prp  = verb.s ! VPresPart ;
    ptp  = verb.s ! VPPart ;
    inf  = verb.s ! VInf ;
    ad   = [] ;
    s2 = \\a => if_then_Str verb.isRefl (reflPron ! a) []
    } ;

}

