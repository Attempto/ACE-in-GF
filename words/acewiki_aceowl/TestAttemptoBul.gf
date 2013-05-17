concrete TestAttemptoBul of TestAttempto = AttemptoBul **
  open SyntaxBul, ParadigmsBul, (L=LexiconBul) in {

flags coding=utf8;

-- TODO: use the correct vocabulary
lin officer_N = mkCN L.person_N ;
lin traveler_N = mkCN L.person_N ;
lin woman_N = mkCN L.woman_N ;
lin man_N = mkCN L.man_N ;
lin golfer_N = mkCN L.person_N ;
lin present_N = mkCN L.person_N ;
lin aquarium_N = mkCN L.person_N ;
lin picture_N = mkCN L.person_N ;
lin person_N = mkCN L.person_N ;

lin mary_PN = L.paris_PN ;
lin tom_PN = L.john_PN ;
lin lisa_PN = L.paris_PN ;
lin john_PN = L.john_PN ;
lin sue_PN = L.paris_PN ;
lin bill_PN = L.john_PN ;

lin see_V2 = L.see_V2 ;
lin buy_V2 = L.buy_V2 ;
lin help_V2 = L.see_V2 ;
lin admire_V2 = L.see_V2 ;
lin love_V2 = L.see_V2 ;
lin inspect_V2 = L.see_V2 ;

} ;
