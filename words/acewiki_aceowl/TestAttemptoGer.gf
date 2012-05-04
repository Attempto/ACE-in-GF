concrete TestAttemptoGer of TestAttempto = AttemptoGer **
  open SyntaxGer, ParadigmsGer, IrregGer, (C = ConstructX), (L = LexiconGer) in {

  flags coding=utf8;

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = regV "warten" ;
  lin ask_V2       = mkV2 (regV "fragen") ;
  lin mad_A        = mkA "wütend" ;
--  lin mad_about_A2 = mkA2 mad_A (mkPrep "about") ;
  lin happy_A      = mkA "glücklich" ;

}
