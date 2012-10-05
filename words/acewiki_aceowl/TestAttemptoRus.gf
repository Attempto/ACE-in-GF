concrete TestAttemptoRus of TestAttempto = AttemptoRus **
  open SyntaxRus, ParadigmsRus, ResRus, (L = LexiconRus) in
{

flags coding=utf8;

  -- TODO: some words are wrong
  lin mary_PN      = mkPN "Mary" Fem Sg Animate ;
  -- TODO: can John become Ivan in translation? ;)
  lin john_PN      = L.john_PN ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = mkV imperfective "прошу" "просишь" "просит" "просим" "просите" "просят" "просил" "проси" "просить" ;
  lin ask_V2       = L.buy_V2 ;
  lin mad_A        = L.blue_A ;
  lin mad_about_A2 = mkA2 (mkA "замужем") "за" instructive ;
  lin happy_A      = L.good_A ;

}
