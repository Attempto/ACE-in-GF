--# -path=.:present

concrete TestAttemptoIta of TestAttempto = AttemptoIta **
  open SyntaxIta, ParadigmsIta, (L=LexiconIta) in {

flags coding=utf8;

lin officer_N = mkCN (mkN "ufficiale") ;
lin traveler_N = mkCN (mkN "viaggiatore") ;
lin woman_N = mkCN L.woman_N ;
lin man_N = mkCN L.man_N ;
lin golfer_N = mkCN (mkN (mkN "giocatore") "di golf") ;
lin present_N = mkCN (mkN "regalo") ;
lin aquarium_N = mkCN (mkN "acquario") ;
lin picture_N = mkCN (mkN "immagine") ;
lin person_N = mkCN L.person_N ;

lin mary_PN = mkPN "Mary" ;
lin tom_PN = mkPN "Tom" ;
lin lisa_PN = mkPN "Lisa" ;
lin john_PN = mkPN "John" ;
lin sue_PN = mkPN "Sue" ;
lin bill_PN = mkPN "Bill" ;

lin see_V2 = L.see_V2;
lin buy_V2 = L.buy_V2;
lin help_V2 = mkV2 (mkV "aiutare") ;
lin admire_V2 = mkV2 (mkV "ammirare") ;
lin love_V2 = L.love_V2 ;
lin inspect_V2 = mkV2 (mkV "ispezionare") ;

}
