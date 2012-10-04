concrete TestAttemptoRon of TestAttempto = AttemptoRon **
  open SyntaxRon, (L = LexiconRon), ParadigmsRon in {

flags coding=utf8;

oper mkkN : Str -> AttemptoRon.CN = \n -> mkCN (mkN n) ;

lin

  officer_N = mkkN "ofițer" ;
  traveler_N = mkkN "călător" ;
  man_N = mkCN L.man_N ;
  woman_N = mkCN L.woman_N ;
  golfer_N = mkkN "jucător de golf" ;
  present_N = mkkN "cadou" ;
  aquarium_N = mkkN "acvariu";
  picture_N = mkkN "imagine" ;
  person_N = mkCN L.person_N ;

  mary_PN = mkPN "Mary" Feminine ;
  tom_PN = mkPN "Tom" Masculine ;
  lisa_PN = mkPN "Lisa" Feminine ;
  john_PN = mkPN "John" Masculine ;
  sue_PN = mkPN "Sue" Feminine ;
  bill_PN = mkPN "Bill" Masculine ;

  see_V2 = L.see_V2 ;
  buy_V2 = L.buy_V2 ;
  help_V2 = dirV2 (mkV "ajuta") ;
  admire_V2 = dirV2 (mkV "admira") ;
  love_V2 = L.love_V2 ;
  inspect_V2 = dirV2 (mkV "inspecta") ;

}
