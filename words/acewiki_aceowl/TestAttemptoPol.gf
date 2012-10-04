concrete TestAttemptoPol of TestAttempto = AttemptoPol **
  open SyntaxPol, ParadigmsPol, (L = LexiconPol) in
{

flags coding=utf8;

  --lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = L.john_PN ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  -- lin wait_V       = mkV "TODO" ;
  lin ask_V2       = L.read_V2 ;
  lin mad_A        = L.bad_A ;
  lin mad_about_A2 = L.married_A2 ;
  lin happy_A      = L.bad_A ;

}
