concrete TestAttemptoRon of TestAttempto = AttemptoRon **
  open SyntaxRon, ParadigmsRon, (L = LexiconRon) in
{

flags coding=utf8;

  lin mary_PN      = mkPN "Mary" Feminine ;
  lin john_PN      = mkPN "John" Masculine ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = mkV "aștepta" ;
  lin ask_V2       = dirV2 (mkV "întreba") ;
  lin mad_A        = mkA "nebun" ;
  lin mad_about_A2 = mkA2 (mkA "nebun") after_Prep;
  lin happy_A      = mkA "fericit" ;

}
