--# -path=.:present

concrete TestAttemptoFre of TestAttempto = AttemptoFre **
  open SyntaxFre, ParadigmsFre, (L=LexiconFre) in {

flags coding=utf8;

lin officer_N = mkCN (mkN "officier") ;
lin traveler_N = mkCN (mkN "voyageur") ;
lin woman_N = mkCN L.woman_N ;
lin man_N = mkCN L.man_N ;
lin golfer_N = mkCN (mkN "golfeur") ;
lin present_N = mkCN (mkN "cadeau") ;
lin aquarium_N = mkCN (mkN "aquarium") ;
lin picture_N = mkCN (mkN "image") ;
lin person_N = mkCN L.person_N ;

lin mary_PN = mkPN "Mary" ;
lin tom_PN = mkPN "Tom" ;
lin lisa_PN = mkPN "Lisa" ;
lin john_PN = mkPN "John" ;
lin sue_PN = mkPN "Sue" ;
lin bill_PN = mkPN "Bill" ;

lin see_V2 = L.see_V2;
lin buy_V2 = L.buy_V2;
lin help_V2 = mkV2 (mkV "aider") ;
lin admire_V2 = mkV2 (mkV "admirer") ;
lin love_V2 = L.love_V2 ;
lin inspect_V2 = mkV2 (mkV "inspecter") ;

}
