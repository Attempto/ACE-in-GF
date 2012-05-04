concrete TestAttemptoAce of TestAttempto = AttemptoAce **
  open SyntaxAce, ParadigmsAce, IrregAce, (C = ConstructX), (L = LexiconAce), (D = DictAce) in {

  flags coding=utf8;

  lin mary_PN      = mkPN (mkN feminine (mkN "Mary")) ;
  lin john_PN      = mkPN (mkN masculine (mkN "John")) ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = D.wait_V;
  lin ask_V2       = D.ask_V2 ;
  lin mad_A        = D.mad_A ;
  lin mad_about_A2 = mkA2 mad_A (mkPrep "about") ;
  lin happy_A      = D.happy_A ;

}
