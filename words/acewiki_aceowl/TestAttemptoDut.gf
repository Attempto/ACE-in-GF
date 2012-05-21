concrete TestAttemptoDut of TestAttempto = AttemptoDut **
  open SyntaxDut, ParadigmsDut, (C = ConstructX), (L = LexiconDut) in {

  flags coding=utf8;

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;

  lin ask_V2       = mkV2 (mkV "vragen") ;
  lin mad_about_A2 = mkA2 (mkA "gek") (mkPrep "op") ;
}
