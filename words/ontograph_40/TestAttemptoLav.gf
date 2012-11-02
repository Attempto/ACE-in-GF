--# -path=.:present

concrete TestAttemptoLav of TestAttempto = AttemptoLav **
  open SyntaxLav, (L = LexiconLav), ParadigmsLav, ResLav in {

flags coding = utf8 ;

oper mkkN : Str -> AttemptoLav.CN = \n -> mkCN (mkN n) ;

lin

  officer_N = mkkN "amatpersona" ;
  traveler_N = mkkN "ceļotājs" ;
  man_N = mkkN "vīrietis" ;
  woman_N = mkkN "sieviete" ;
  golfer_N = mkkN "golferis" ;
  present_N = mkkN "dāvana" ;
  aquarium_N = mkkN "akvārijs" ;
  picture_N = mkkN "attēls" ;
  person_N = mkkN "persona" ;

  mary_PN = mkPN "Mērija" ;
  tom_PN = mkPN "Toms" ;
  lisa_PN = mkPN "Līza" ;
  john_PN = mkPN "Džons" ;
  sue_PN = mkPN "Sjū" ;
  bill_PN = mkPN "Bils" ;

  see_V2 = mkV2 (mkV "redzēt" third_conjugation) acc_Prep Nom ;
  --see_V2 = mkV2 (mkV "redzēt" third_conjugation) nom_Prep Acc ; -- Passive

  buy_V2 = mkV2 (mkV "pirkt" "pērku" "pirku") acc_Prep Nom ;
  --buy_V2 = mkV2 (mkV "pirkt" "pērku" "pirku") nom_Prep Acc ; -- Passive
  
  help_V2 = mkV2 (mkV "palīdzēt" third_conjugation) dat_Prep Nom ;
  --help_V2 = mkV2 (mkV "palīdzēt" third_conjugation) nom_Prep Dat ; -- Passive
  
  admire_V2 = mkV2 (mkV "apbrīnot" second_conjugation) acc_Prep Nom ;
  --admire_V2 = mkV2 (mkV "apbrīnot" second_conjugation) nom_Prep Acc ; -- Passive
  
  love_V2 = mkV2 (mkV "mīlēt" third_conjugation) acc_Prep Nom ;
  --love_V2 = mkV2 (mkV "mīlēt" third_conjugation) nom_Prep Acc ; -- Passive

  inspect_V2 = mkV2 (mkV "apskatīt" third_conjugation) acc_Prep Nom ;
  --inspect_V2 = mkV2 (mkV "apskatīt" third_conjugation) nom_Prep Acc ; -- Passive

}
