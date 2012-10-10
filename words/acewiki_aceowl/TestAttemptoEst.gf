concrete TestAttemptoEst of TestAttempto = AttemptoEst **
  open SyntaxEst, ParadigmsEst, (L = LexiconEst) in
{

flags coding=utf8;

  lin mary_PN      = mkPN "Mari" ;
  lin john_PN      = mkPN "Jüri" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = mkV "ootama";
  lin ask_V2       = mkV2 "küsima" ;
  lin mad_A        = mkA "hull" ;
  lin mad_about_A2 = mkA2 (mkA "hull") after_Prep ;
  lin happy_A      = mkA "õnnelik" ;

}
