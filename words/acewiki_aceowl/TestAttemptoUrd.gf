concrete TestAttemptoUrd of TestAttempto = AttemptoUrd **
  open SyntaxUrd, ParadigmsUrd, (C = ConstructX), (L = LexiconUrd) in {

  flags coding=utf8;

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = mkV "WAIT" ;
  lin ask_V2       = mkV2 "ASK" ;
  lin mad_A        = mkA "MAD" ;
  lin mad_about_A2 = mkA2 mad_A "ABOUT" ;
  lin happy_A      = mkA "HAPPY" ;

}
