concrete TestAttemptoIta of TestAttempto = AttemptoIta **
  open SyntaxIta, ParadigmsIta, (C = ConstructX), (L = LexiconIta) in {

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = mkV "aspettare" ;
  lin ask_V2       = mkV2 "domandare" ;
  lin mad_A        = mkA "arrabbiato" ;
  lin mad_about_A2 = mkA2 (mkA "pazzo") da_Prep ;
  lin happy_A      = mkA "felice" ;

}
