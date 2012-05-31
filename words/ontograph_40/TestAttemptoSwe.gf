--# -path=.:present

concrete TestAttemptoSwe of TestAttempto = AttemptoSwe **
  open SyntaxSwe, ParadigmsSwe, (L=LexiconSwe) in {

flags coding=utf8;

-- TODO: override gender (ett befäl)
lin officer_N = mkCN (mkN "befäl") ;
lin traveler_N = mkCN (mkN "resenär") ;
lin woman_N = mkCN L.woman_N ;
lin man_N = mkCN L.man_N ;
-- TODO: override gender (en golfspelare)
lin golfer_N = mkCN (mkN "golfspelare") ;
lin present_N = mkCN (mkN "present") ;
lin aquarium_N = mkCN (mkN "akvarium") ;
lin picture_N = mkCN (mkN "bild") ;
lin person_N = mkCN L.person_N ;

lin mary_PN = mkPN "Mary" ;
lin tom_PN = mkPN "Tom" ;
lin lisa_PN = mkPN "Lisa" ;
lin john_PN = mkPN "John" ;
lin sue_PN = mkPN "Sue" ;
lin bill_PN = mkPN "Bill" ;

lin see_V2 = L.see_V2;
lin buy_V2 = L.buy_V2;
lin help_V2 = mkV2 (mkV "assistera") ;
lin admire_V2 = mkV2 (mkV "beundra") ;
lin love_V2 = L.love_V2 ;
lin inspect_V2 = mkV2 (mkV "avsyna") ;

}
