--# -path=.:present

concrete TestAttemptoSpa of TestAttempto = AttemptoSpa **
  open SyntaxSpa, ParadigmsSpa, (L=LexiconSpa) in {

flags coding=utf8;

lin officer_N = mkCN (mkN "funcionario") ;
lin traveler_N = mkCN (mkN "viajero") ;
lin woman_N = mkCN L.woman_N ;
lin man_N = mkCN L.man_N ;
lin golfer_N = mkCN (mkN "golfista") ;
lin present_N = mkCN (mkN "regalo") ;
lin aquarium_N = mkCN (mkN "acuario") ;
lin picture_N = mkCN (mkN "imagen") ;
lin person_N = mkCN L.person_N ;

lin mary_PN = mkPN "Mary" ;
lin tom_PN = mkPN "Tom" ;
lin lisa_PN = mkPN "Lisa" ;
lin john_PN = mkPN "John" ;
lin sue_PN = mkPN "Sue" ;
lin bill_PN = mkPN "Bill" ;

lin see_V2 = L.see_V2;
lin buy_V2 = L.buy_V2;
lin help_V2 = mkV2 (mkV "ayudar") ;
lin admire_V2 = mkV2 (mkV "admirar") ;
lin love_V2 = L.love_V2 ;
lin inspect_V2 = mkV2 (mkV "inspeccionar") ;

} ;
