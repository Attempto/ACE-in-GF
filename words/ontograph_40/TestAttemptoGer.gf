--# -path=.:present

concrete TestAttemptoGer of TestAttempto = AttemptoGer **
  open SyntaxGer, LexiconGer, ParadigmsGer in {

flags coding=utf8;

oper mkkN : Str -> AttemptoGer.CN = \n -> mkCN (mkN n) ;
oper mk2N : Str -> Str -> Gender -> AttemptoGer.CN =
	\sg,pl,gen -> mkCN (mkN sg pl gen) ;

lin officer_N = mk2N "Offizier" "Offiziere" masculine ;
lin traveler_N = mk2N "Reisende" "Reisenden" masculine ;
lin man_N = mkCN LexiconGer.man_N ;
lin woman_N = mkCN LexiconGer.woman_N ;
lin golfer_N = mkkN "Golfer" ;
lin present_N = mk2N "Geschenk" "Geschenke" neuter ;
lin aquarium_N = mk2N "Aquarium" "Aquarien" neuter ;
lin picture_N = mk2N "Bild" "Bilder" neuter ;
lin person_N = mkCN LexiconGer.person_N ;

lin mary_PN = mkPN "Mary" ;
lin tom_PN = mkPN "Tom" ;
lin lisa_PN = mkPN "Lisa" ;
lin john_PN = mkPN "John" ;
lin sue_PN = mkPN "Sue" ;
lin bill_PN = mkPN "Bill" ;

lin see_V2 = LexiconGer.see_V2 ;
lin buy_V2 = LexiconGer.buy_V2 ;
-- Note that we do not care about the imperfect forms
lin help_V2 = mkV2 (mkV "helfen" "hilft" "~" "~" "geholfen") dative ;
lin admire_V2 = mkV2 (mkV "bewundern" "bewundert" "~" "~" "bewundert") accusative ;
lin love_V2 = LexiconGer.love_V2 ;
lin inspect_V2 = mkV2 (mkV "inspizieren") accusative ;

}
