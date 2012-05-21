--# -path=.:present

concrete TestAttemptoDut of TestAttempto = AttemptoDut **
  open SyntaxDut, (L = LexiconDut), ParadigmsDut in {

oper mkkN : Str -> AttemptoDut.CN = \n -> mkCN (mkN n) ;

lin

  officer_N = mkCN (mkN "officier" "officieren" de);
  traveler_N = mkkN "reiziger" ;
  man_N = mkCN L.man_N ;
  woman_N = mkCN L.woman_N ;
  golfer_N = mkkN "golfer" ;
  -- TODO: report: single arg paradigm generates: cadeau's
  present_N = mkCN (mkN "cadeau" "cadeaus" het) ;
  -- TODO: report: single arg paradigm generates: aquariummen
  aquarium_N = mkCN (mkN "aquarium" "aquaria" het);
  -- TODO: report: single arg paradigm generates: schilderijjen
  picture_N = mkCN (mkN "schilderij" "schilderijen" het) ;
  person_N = mkCN L.person_N ;

  mary_PN = mkPN "Mary" ;
  tom_PN = mkPN "Tom" ;
  lisa_PN = mkPN "Lisa" ;
  john_PN = mkPN "John" ;
  sue_PN = mkPN "Sue" ;
  bill_PN = mkPN "Bill" ;

  -- TODO: report: lexicon generates `zit' as 3rd person sg
  -- see_V2 = L.see_V2 ;
  see_V2 = mkV2 (mkV "zien" "ziet" "zien" "~" "~" "gezien") ;
  buy_V2 = L.buy_V2 ;
  help_V2 = mkV2 "helpen" ;
  -- TODO: report: single arg smart paradigm generates
  -- `bewondeert' as 3rd person sg
  admire_V2 = mkV2 (mkV "bewonderen" "bewondert" "bewonderen" "~" "~" "bewonderd");
  -- love_V2 = mkV2 (mkV "houden") (mkPrep "van") ;
  love_V2 = L.love_V2 ;
  inspect_V2 = mkV2 "inspecteren" ;

}
