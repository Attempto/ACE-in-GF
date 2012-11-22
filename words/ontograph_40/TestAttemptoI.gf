--# -path=.:present

incomplete concrete TestAttemptoI of TestAttempto = AttemptoAce **
  open Oper in {

lin

-- nouns
officer_N = aceN human "officer" ;
traveler_N = aceN human "traveler" ;
man_N = aceN masculine "man" "men" ;
woman_N = aceN feminine "woman" "women" ;
golfer_N = aceN human "golfer" ;
present_N = aceN "present" ;
aquarium_N = aceN "aquarium" ;
picture_N = aceN "picture" ;
person_N = aceN human "person" ;

-- proper names
mary_PN = acePN "Mary" ;
tom_PN = acePN "Tom" ;
lisa_PN = acePN "Lisa" ;
john_PN = acePN "John" ;
sue_PN = acePN "Sue" ;
bill_PN = acePN "Bill" ;

-- transitive verbs
see_V2 = aceV2 "see" "sees" "seen" ;
buy_V2 = aceV2 "buy" "buys" "bought" ;
help_V2 = aceV2 "help" "helps" "helped" ;
admire_V2 = aceV2 "admire" "admires" "admired" ;
love_V2 = aceV2 "love" "loves" "loved" ;
inspect_V2 = aceV2 "inspect" "inspects" "inspected" ;

}
