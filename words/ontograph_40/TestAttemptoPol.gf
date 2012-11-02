--# -path=.:present

concrete TestAttemptoPol of TestAttempto = AttemptoPol **
  open SyntaxPol, (L = LexiconPol), ParadigmsPol in {

flags coding=utf8;

-- TODO: Polish does not offer smart paradigms
-- so we just use some existing lexicon entries.

lin

  officer_N = mkCN L.man_N ;
  traveler_N = mkCN L.man_N ;
  man_N = mkCN L.man_N ;
  woman_N = mkCN L.woman_N ;
  golfer_N = mkCN L.man_N ;
  present_N = mkCN L.man_N ;
  aquarium_N = mkCN L.man_N ;
  picture_N = mkCN L.man_N ;
  person_N = mkCN L.man_N ;

  john_PN = L.john_PN ;
  mary_PN = L.paris_PN ;
  tom_PN = L.paris_PN ;
  lisa_PN = L.paris_PN ;
  sue_PN = L.paris_PN ;
  bill_PN = L.paris_PN ;

  see_V2 = L.see_V2 ;
  buy_V2 = L.buy_V2 ;
  help_V2 = L.read_V2 ;
  admire_V2 = L.read_V2 ;
  love_V2 = L.love_V2 ;
  inspect_V2 = L.read_V2 ;

}
