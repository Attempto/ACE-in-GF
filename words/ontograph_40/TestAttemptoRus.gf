concrete TestAttemptoRus of TestAttempto = AttemptoRus **
  open SyntaxRus, (L = LexiconRus), ResRus, ParadigmsRus in {

flags coding=utf8;

oper mkkN : Str -> AttemptoRus.CN = \n -> mkCN (mkN n) ;

lin

  officer_N = mkkN "офицер" ;
  traveler_N = mkkN "путешественник" ;
  man_N = mkCN L.man_N ;
  woman_N = mkCN L.woman_N ;
  golfer_N = mkkN "игрок в гольф" ;
  present_N = mkkN "подарок" ;
  aquarium_N = mkkN "аквариум" ;
  picture_N = mkkN "картина" ;
  person_N = mkCN L.person_N ;

  mary_PN = mkPN "Mary" Fem Sg Animate ;
  tom_PN = mkPN "Tom" Masc Sg Animate ;
  lisa_PN = mkPN "Lisa" Fem Sg Animate ;
  john_PN = L.john_PN ;
  sue_PN = mkPN "Sue" Fem Sg Animate ;
  bill_PN = mkPN "Bill" Masc Sg Animate ;

  see_V2 = L.see_V2 ;
  buy_V2 = L.buy_V2 ;
  help_V2 = L.push_V2 ;
  admire_V2 = L.fear_V2 ;
  love_V2 = L.love_V2 ;
  inspect_V2 = L.eat_V2 ;

}
