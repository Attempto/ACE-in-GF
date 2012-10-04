concrete TestAttemptoDan of TestAttempto = AttemptoDan **
  open SyntaxDan, ParadigmsDan, IrregDan, (L = LexiconDan) in
{

flags coding=utf8;

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = regV "vente" ;
  lin ask_V2       = mkV2 (regV "spørge") ;
  lin mad_A        = mkA "gal" ;
  lin mad_about_A2 = mkA2 mad_A (mkPrep "over");
  lin happy_A      = mkA "lykkelig" ;

}
