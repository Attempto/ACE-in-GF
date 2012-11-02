--# -path=.:present

concrete TestAttemptoNor of TestAttempto = AttemptoNor **
  open SyntaxNor, (L = LexiconNor), ParadigmsNor in {

flags coding=utf8;

oper mkkN : Str -> AttemptoNor.CN = \n -> mkCN (mkN n) ;

lin

  officer_N = mkkN "offiser";
  traveler_N = mkkN "reisende" ;
  man_N = mkCN L.man_N ;
  woman_N = mkCN L.woman_N ;
  golfer_N = mkkN "golfspiller" ;
  present_N = mkkN "gave" ;
  aquarium_N = mkkN "akvarium";
  picture_N = mkkN "bilde" ;
  person_N = mkCN L.person_N ;

  mary_PN = mkPN "Mary" ;
  tom_PN = mkPN "Tom" ;
  lisa_PN = mkPN "Lisa" ;
  john_PN = mkPN "John" ;
  sue_PN = mkPN "Sue" ;
  bill_PN = mkPN "Bill" ;

  see_V2 = L.see_V2 ;
  buy_V2 = L.buy_V2 ;
  help_V2 = mkV2 "hjelpe" ;
  admire_V2 = mkV2 (mkV "beundre");
  love_V2 = L.love_V2 ;
  inspect_V2 = mkV2 "inspisere" ;

}
