--# -path=.:present

concrete TestAttemptoGer of TestAttempto = AttemptoGer **
  open SyntaxGer, LexiconGer, ParadigmsGer in {

flags coding=utf8;

oper mkkN : Str -> AttemptoGer.CN = \n -> mkCN (mkN n) ;
oper mk2N : Str -> Str -> Gender -> AttemptoGer.CN =
	\sg,pl,gen -> mkCN (mkN sg pl gen) ;

lin officer_N = mk2N "Offizier" "Offiziere" masculine ;
-- TODO: specify both plurals: Reisende and Reisenden
-- http://www.canoo.net/services/Controller?dispatch=inflection&input=Reisende&features=(Cat+N)&lang=de
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

-- Note that we do not care about the imperfect forms
-- TODO: can/should one use datV2 and dirV2 here?
lin see_V2 = LexiconGer.see_V2 ;
lin buy_V2 = LexiconGer.buy_V2 ;
--lin help_V2 = mkV2 (mkV "helfen" "hilft" "~" "~" "geholfen") dative ;
--lin admire_V2 = mkV2 (mkV "bewundern" "bewundert" "~" "~" "bewundert") accusative ;
lin help_V2 = datV2 (mkV "helfen" "hilft" "~" "~" "geholfen") ;
lin admire_V2 = dirV2 (mkV "bewundern" "bewundert" "~" "~" "bewundert") ;
lin love_V2 = LexiconGer.love_V2 ;
--lin inspect_V2 = mkV2 (mkV "inspizieren") accusative ;
lin inspect_V2 = dirV2 (mkV "inspizieren") ;

}
