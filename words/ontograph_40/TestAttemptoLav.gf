concrete TestAttemptoLav of TestAttempto = AttemptoLav **
  open SyntaxLav, (L = LexiconLav), ParadigmsLav in {

flags coding=utf8;

oper mkkN : Str -> AttemptoLav.CN = \n -> mkCN (mkN n) ;

lin

  officer_N = mkkN "amatpersona" ;
  traveler_N = mkkN "ceļotājs" ;
  man_N = mkCN L.man_N ;
  woman_N = mkCN L.woman_N ;
  golfer_N = mkkN "golfa spēlētājs" ;
  present_N = mkkN "klāt" ;
  aquarium_N = mkkN "akvāriju";
  picture_N = mkkN "attēlu" ;
  person_N = mkCN L.person_N ;

  mary_PN = mkPN "Mary" ;
  tom_PN = mkPN "Tom" ;
  lisa_PN = mkPN "Lisa" ;
  john_PN = mkPN "John" ;
  sue_PN = mkPN "Sue" ;
  bill_PN = mkPN "Bill" ;

  see_V2 = L.see_V2 ;
  buy_V2 = L.buy_V2 ;
  help_V2 = mkV2 (mkV "palīdzēt" second_conjugation) dat_Prep ;
  admire_V2 = mkV2 (mkV "gribēt" second_conjugation) dat_Prep ;
  love_V2 = L.love_V2 ;
  inspect_V2 = mkV2 (mkV "apskatīt" second_conjugation) dat_Prep ;

}
