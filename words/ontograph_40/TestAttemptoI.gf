--# -path=.:present

incomplete concrete TestAttemptoI of TestAttempto = AttemptoAce **
  open Syntax, Oper in {

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

lin mary_PN = acePN "Mary" ;
lin tom_PN = acePN "Tom" ;
lin lisa_PN = acePN "Lisa" ;
lin john_PN = acePN "John" ;
lin sue_PN = acePN "Sue" ;
lin bill_PN = acePN "Bill" ;

lin see_V2 = aceV2 "see" "sees" "seen" ;
lin buy_V2 = aceV2 "buy" "buys" "bought" ;
lin help_V2 = aceV2 "help" "helps" "helped" ;
lin admire_V2 = aceV2 "admire" "admires" "admired" ;
lin love_V2 = aceV2 "love" "loves" "loved" ;
lin inspect_V2 = aceV2 "inspect" "inspects" "inspected" ;

}
