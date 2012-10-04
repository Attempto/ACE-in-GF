concrete TestAttemptoLav of TestAttempto = AttemptoLav **
  open SyntaxLav, ParadigmsLav, (L = LexiconLav) in
{

flags coding=utf8;

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = mkV "gaidīt" third_conjugation ;
  lin ask_V2       = mkV2 (mkV "jautāt" second_conjugation) dat_Prep ;
  lin mad_A        = mkA "traks" ;
  -- TODO: replace precēties (= married)
  lin mad_about_A2 = mkA2 (mkA (mkV "precēties" third_conjugation)) with_Prep ;
  lin happy_A      = mkA "laimīgs" ;

}
