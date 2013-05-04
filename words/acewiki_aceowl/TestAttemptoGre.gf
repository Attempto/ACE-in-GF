concrete TestAttemptoGre of TestAttempto = AttemptoGre **
  open SyntaxGre, ParadigmsGre, (L = LexiconGre) in
{

-- TODO: use correct words
flags coding=utf8;

  lin mary_PN      = mkPN "Μαρία" ;
  lin john_PN      = L.john_PN ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = L.swim_V ;
  lin ask_V2       = L.break_V2 ;
  lin mad_A        = L.stupid_A ;
  lin mad_about_A2 = mkA2 mad_A after_Prep ;
  lin happy_A      = L.good_A ;

}
