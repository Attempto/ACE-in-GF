concrete TestAttemptoFin of TestAttempto = AttemptoFin **
  open SyntaxFin, ParadigmsFin, (L=LexiconFin), (C = ConstructX) in {

  flags coding=utf8;

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  -- lin wait_V       = mkV "wait" "waits" "waited" "waited" "waiting" ;
  -- lin ask_V2       = mkV2 "ask" ;
  -- lin mad_A        = mkA "mad" ;
  -- lin mad_about_A2 = mkA2 mad_A (postGenPrep "about") ;
  -- lin happy_A      = mkA "happy" ;

}
