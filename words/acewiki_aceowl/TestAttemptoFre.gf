concrete TestAttemptoFre of TestAttempto = AttemptoFre **
  open SyntaxFre, ParadigmsFre, IrregFre, (C = ConstructX), (L = LexiconFre) in {

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = mkV L.wait_V2 ;
  lin ask_V2       = mkV2 (regV "demander") ;
  lin mad_A        = mkA "furieux" "furieuse" ;
--  lin mad_about_A2 = mkA2 mad_A (mkPrep "about") ;
  lin happy_A      = mkA "joyeux" "joyeuse" ;

}
