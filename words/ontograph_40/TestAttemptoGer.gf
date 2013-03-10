--# -path=.:present

concrete TestAttemptoGer of TestAttempto = AttemptoGer **
  open SyntaxGer, (L=LexiconGer), (I=IrregGer), ParadigmsGer in {

flags coding=utf8;

oper mkkN : Str -> AttemptoGer.CN = \n -> mkCN (mkN n) ;
oper mk2N : Str -> Str -> Gender -> AttemptoGer.CN =
	\sg,pl,gen -> mkCN (mkN sg pl gen) ;

lin officer_N = mk2N "Offizier" "Offiziere" masculine ;
-- TODO: specify both plurals: Reisende and Reisenden
-- http://www.canoo.net/services/Controller?dispatch=inflection&input=Reisende&features=(Cat+N)&lang=de
lin traveler_N = mk2N "Reisende" "Reisenden" masculine ;
lin man_N = mkCN L.man_N ;
lin woman_N = mkCN L.woman_N ;
lin golfer_N = mkkN "Golfer" ;
lin present_N = mk2N "Geschenk" "Geschenke" neuter ;
lin aquarium_N = mk2N "Aquarium" "Aquarien" neuter ;
lin picture_N = mk2N "Bild" "Bilder" neuter ;
lin person_N = mkCN L.person_N ;

lin mary_PN = mkPN "Mary" ;
lin tom_PN = mkPN "Tom" ;
lin lisa_PN = mkPN "Lisa" ;
lin john_PN = mkPN "John" ;
lin sue_PN = mkPN "Sue" ;
lin bill_PN = mkPN "Bill" ;

lin see_V2 = L.see_V2 ;
lin buy_V2 = L.buy_V2 ;
lin help_V2 = mkV2 I.helfen_V dative ;
lin admire_V2 = mkV2 (fixprefixV "be" (mkV "wundern")) ;
lin love_V2 = L.love_V2 ;
lin inspect_V2 = mkV2 (mkV "inspizieren") ;

}
