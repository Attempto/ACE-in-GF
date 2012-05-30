concrete TestAttemptoCat of TestAttempto = AttemptoCat **
  open SyntaxCat, ParadigmsCat, (C = ConstructX), (L = LexiconCat) in {

  flags coding=utf8;

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = mkV "esperar" ;
  lin ask_V2       = mkV2 "demanar" ;
  lin mad_A        = mkA "boig" ;
  lin mad_about_A2 = mkA2 (mkA "boig") for_Prep ; 
  lin happy_A      = mkA "feliç" ;

}
