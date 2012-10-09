concrete TestAttemptoLav of TestAttempto = AttemptoLav **
  open SyntaxLav, (L = LexiconLav), ParadigmsLav in {

flags coding=utf8;

oper mkkN : Str -> AttemptoLav.CN = \n -> mkCN (mkN n) ;

lin

  officer_N = mkkN "amatpersona" ;
  traveler_N = mkkN "ceļotājs" ;
  man_N = mkCN L.man_N ;
  woman_N = mkCN L.woman_N ;
  golfer_N = mkkN "golferis" ;
  present_N = mkkN "dāvana" ;
  aquarium_N = mkkN "akvārijs";
  picture_N = mkkN "attēls" ;
  person_N = mkCN L.person_N ;

  mary_PN = mkPN "Mērija" ;
  tom_PN = mkPN "Toms" ;
  lisa_PN = mkPN "Līza" ;
  john_PN = mkPN "Džons" ;
  sue_PN = mkPN "Sjū" ;
  bill_PN = mkPN "Bils" ;

  see_V2 = L.see_V2 ;
  buy_V2 = L.buy_V2 ;
  help_V2 = mkV2 (mkV "palīdzēt" third_conjugation) dat_Prep ;
  admire_V2 = mkV2 (mkV "apbrīnot" second_conjugation) acc_Prep ;
  love_V2 = L.love_V2 ;
  inspect_V2 = mkV2 (mkV "apskatīt" third_conjugation) acc_Prep ;

}
