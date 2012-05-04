concrete TestAttemptoSwe of TestAttempto = AttemptoSwe **
  open SyntaxSwe, ParadigmsSwe, IrregSwe, (C = ConstructX), (L = LexiconSwe) in {

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = mkV "väntar" ;
  lin ask_V2       = mkV2 (regV "frågar") ;
  lin mad_A        = mkA "arg" ;
  lin mad_about_A2 = mkA2 (mkA "galen") (mkPrep "i") ;
  lin happy_A      = mkA "glad" ;

}
