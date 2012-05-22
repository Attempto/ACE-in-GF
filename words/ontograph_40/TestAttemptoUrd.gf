--# -path=.:present

concrete TestAttemptoUrd of TestAttempto = AttemptoUrd **
  open SyntaxUrd, ParadigmsUrd, (L=LexiconUrd) in {

flags coding=utf8;

-- I copy/pasted these from Google translate, they are likely hopelessly wrong [JJC]

lin officer_N = mkCN (mkN "افسر") ;
lin traveler_N = mkCN (mkN "مسافر") ;
lin woman_N = mkCN L.woman_N ;
lin man_N = mkCN L.man_N ;
lin golfer_N = mkCN (mkN "گولفر") ;
lin present_N = mkCN (mkN "پیش") ;
lin aquarium_N = mkCN (mkN "ایکویریم") ;
lin picture_N = mkCN (mkN "تصویر") ;
lin person_N = mkCN L.person_N ;

lin mary_PN = mkPN "Mary" ;
lin tom_PN = mkPN "Tom" ;
lin lisa_PN = mkPN "Lisa" ;
lin john_PN = mkPN "John" ;
lin sue_PN = mkPN "Sue" ;
lin bill_PN = mkPN "Bill" ;

lin see_V2 = L.see_V2;
lin buy_V2 = L.buy_V2;
lin help_V2 = mkV2 (mkV "مدد") ;
lin admire_V2 = mkV2 (mkV "کی تعریف کی") ;
lin love_V2 = L.love_V2 ;
lin inspect_V2 = mkV2 (mkV "معائنہ") ;

}
