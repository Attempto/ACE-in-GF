instance LexAttemptoBul of LexAttempto =
  open
   ExtraBul,
   SyntaxBul,
   ParadigmsBul,
   ConstructX,
   (E = ExtraBul),
   (L = LangBul)
   in {

flags coding=utf8 ;

oper
  -- TODO: this is defined in /DictEngBul.gf
  --false_A = mkA "false" ;
  false_A = variants {};

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "TODO" ;

} ;
