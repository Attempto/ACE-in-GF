--# -path=.:present

concrete TestAttemptoDut of TestAttempto = AttemptoDut **
  open SyntaxDut, (L = LexiconDut), ParadigmsDut in {

oper mkkN : Str -> AttemptoDut.CN = \n -> mkCN (mkN n) ;

lin

  officer_N = mkCN L.policeman_N ;
  traveler_N = mkkN "reiziger" ;
  man_N = mkCN L.man_N ;
  woman_N = mkCN L.woman_N ;
  golfer_N = mkkN "golfspeler" ;
  present_N = mkkN "cadeau" ;
  aquarium_N = mkkN "aquarium" ;
  picture_N = mkkN "afbeelding" ;
  person_N = mkCN L.person_N ;

  mary_PN = mkPN "Mary" ;
  tom_PN = mkPN "Tom" ;
  lisa_PN = mkPN "Lisa" ;
  john_PN = mkPN "John" ;
  sue_PN = mkPN "Sue" ;
  bill_PN = mkPN "Bill" ;

  -- TODO: report: Lexicon generates `zit' as 3rd person sg
  -- see_V2 = L.see_V2 ;
  see_V2 = mkV2 (mkV "zien" "ziet" "zien" "~" "~" "gezien") ;
  buy_V2 = L.buy_V2 ;
  help_V2 = mkV2 "helpen" ;
  admire_V2 = mkV2 "bewonderen" ;
  -- love_V2 = mkV2 (mkV "houden") (mkPrep "van") ;
  love_V2 = L.love_V2 ;
  inspect_V2 = mkV2 "inspecteren" ;

}
