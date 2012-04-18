--# -path=.:present

concrete TestAttemptoGer of TestAttempto = AttemptoGer **
  open SyntaxGer, ParadigmsGer in {

oper mkkN : Str -> AttemptoGer.CN = \n -> mkCN (mkN n) ;

lin officer_N = mkkN "Offizier" ;
lin traveler_N = mkkN "Reisende" ; -- der
--lin man_N = mkCN (mkN masculine (mkN "Mann")) ;
--lin woman_N = mkCN (mkN feminine (mkN "Frau")) ;
lin golfer_N = mkkN "Golfer" ;
lin present_N = mkkN "Geschenk" ;
lin aquarium_N = mkkN "Aquarium" ;
lin picture_N = mkkN "Bild" ;
lin person_N = mkkN "Person" ;

lin mary_PN = mkPN "Mary" ;
lin tom_PN = mkPN "Tom" ;
lin lisa_PN = mkPN "Lisa" ;
lin john_PN = mkPN "John" ;
lin sue_PN = mkPN "Sue" ;
lin bill_PN = mkPN "Bill" ;

lin see_V2 = mkV2 "sehen" ;
lin buy_V2 = mkV2 "kaufen" ;
lin help_V2 = mkV2 "helfen" ;
lin admire_V2 = mkV2 "bewunderen";
lin love_V2 = mkV2 "lieben" ;
lin inspect_V2 = mkV2 "inspizieren" ;

}
