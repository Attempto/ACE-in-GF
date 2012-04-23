--# -path=.:present

concrete TestAttemptoAce of TestAttempto = AttemptoAce **
  open SyntaxAce, ParadigmsAce in {

oper mkkN : Str -> AttemptoAce.CN = \n -> mkCN (mkN n) ;

lin officer_N = mkkN "officer" ;
lin traveler_N = mkCN (mkN human (mkN "traveler")) ;
lin man_N = mkCN (mkN masculine (mkN "man" "men")) ;
lin woman_N = mkCN (mkN feminine (mkN "woman" "women")) ;
lin golfer_N = mkkN "golfer" ;
lin present_N = mkkN "present" ;
lin aquarium_N = mkkN "aquarium" ;
lin picture_N = mkkN "picture" ;
lin person_N = mkkN "person" ;

lin mary_PN = mkPN "Mary" ;
lin tom_PN = mkPN "Tom" ;
lin lisa_PN = mkPN "Lisa" ;
lin john_PN = mkPN "John" ;
lin sue_PN = mkPN "Sue" ;
lin bill_PN = mkPN "Bill" ;

lin see_V2 = aceV2 "see" "sees" "seen";
lin buy_V2 = aceV2 "buy" "buys" "bought";
lin help_V2 = mkV2 "help" ;
lin admire_V2 = mkV2 "admire";
lin love_V2 = mkV2 "love" ;
lin inspect_V2 = mkV2 "inspect" ;

}
