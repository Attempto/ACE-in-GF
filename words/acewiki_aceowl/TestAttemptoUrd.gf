concrete TestAttemptoUrd of TestAttempto = AttemptoUrd **
  open SyntaxUrd, ParadigmsUrd, IrregUrd, (C = ConstructX), (L = LexiconUrd) in {

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
--  lin wait_V       = mkV "wait" "waits" "waited" "waited" "waiting";
--  lin ask_V2       = mkV2 "ask" ;
--  lin mad_A        = mkA "mad" ;
--  lin mad_about_A2 = mkA2 mad_A (mkPrep "about") ;
--  lin happy_A      = mkA "happy" ;

}
