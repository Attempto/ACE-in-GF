concrete TestAttemptoFin of TestAttempto = AttemptoFin **
  open SyntaxFin, ParadigmsFin, (L=LexiconFin), ResFin in {

  flags coding=utf8;

  lin mary_PN      = mkPN "Mary" ;
  lin john_PN      = mkPN "John" ;
  lin woman_CN     = mkCN L.woman_N ;
  lin man_CN       = mkCN L.man_N ;
  lin friend_CN    = mkCN L.friend_N ;
  lin wait_V       = mkV "odottaa" ;
  lin ask_V2       = mkV2 "kysyä" ;
  lin mad_A        = mkA "hullu" ;
  -- John is mad-about Mary: John on hulluna Maryyn (Mary=illative, mad=essive)
  -- TODO: for the time being we just generate an essive string for mkA
  lin mad_about_A2 = mkA2 (mkA ((mkN "hullu").s ! NCase Sg Ess)) (casePrep illative) ;
  lin happy_A      = mkA "onnellinen" ;

}
