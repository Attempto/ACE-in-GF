concrete TestAttemptoSpa of TestAttempto = AttemptoSpa **
  open SyntaxSpa, ParadigmsSpa, (C = ConstructX), (L = LexiconSpa) in {

  flags coding=utf8;

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = mkV "esperar" ;
  lin ask_V2       = mkV2 "pedir" ;
  lin mad_A        = mkA "loco" ;
  lin mad_about_A2 = AttemptoSpa.mkA2 (mkA "loco") by8means_Prep ;
  lin happy_A      = mkA "feliz" ;

}
