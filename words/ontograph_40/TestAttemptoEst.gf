--# -path=.:present

concrete TestAttemptoEst of TestAttempto = AttemptoEst **
  open SyntaxEst, ParadigmsEst, (L=LexiconEst) in {

flags coding=utf8;

lin officer_N = mkCN (mkN "ohvitser") ;
lin traveler_N = mkCN (mkN "reisija") ;
lin woman_N = mkCN L.woman_N ;
lin man_N = mkCN L.man_N ;
lin golfer_N = mkCN (mkN "golfimängija") ;
lin present_N = mkCN (mkN "kingitus") ;
lin aquarium_N = mkCN (mkN "akvaarium") ;
lin picture_N = mkCN (mkN "pilt") ;
lin person_N = mkCN L.person_N ;

lin mary_PN = mkPN "Mari" ;
lin tom_PN = mkPN "Toomas" ;
lin lisa_PN = mkPN "Liisa" ;
lin john_PN = mkPN "Jaan" ;
lin sue_PN = mkPN "Sue" ;
lin bill_PN = mkPN "Villem" ;

lin see_V2 = L.see_V2;
lin buy_V2 = L.buy_V2;
lin help_V2 = mkV2 (mkV "aitama") ;
lin admire_V2 = mkV2 (mkV "imetlema") ;
lin love_V2 = L.love_V2 ;
lin inspect_V2 = mkV2 (mkV "uurima") ;

} ;
