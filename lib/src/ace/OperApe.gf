--# -path=.:../abstract:../../prelude:../common

-- TODO: quote Prolog atom names
-- TODO: how to escape a token-internal quote
-- TODO: add Gender to acePN
-- TODO: provide convenience operators (smart paradigms)

instance OperApe of Oper = ParadigmsEng - [mkA2, mkA2S, mkA2V, prepA2] ** open CatAce, ResAce in {
oper

-- tv_finsg(ThirdSgForm, LogicalSymbol).
-- tv_infpl(InfForm, LogicalSymbol).
-- tv_pp(PastPartForm, LogicalSymbol).
-- TODO: maybe expect that the LogicalSymbol is provided via a further parameter
-- or maybe it's possible to access the function name
aceV2 : (_,_,_:Str) -> V2 = \go,goes,gone -> mkV2 (mkV
  ("tv_finsg('" + go + "','" + go + "_V2')")
  ("tv_infpl('" + goes + "','" + go + "_V2')")
  "~"
  ("tv_pp('" + gone + "','" + go + "_V2')")
  "~") ;

-- pn_sg(WordForm, LogicalSymbol, Gender).
-- pn_pl(WordForm, LogicalSymbol, Gender).
-- pndef_sg(WordForm, LogicalSymbol, Gender).
-- pndef_pl(WordForm, LogicalSymbol, Gender).
acePN : (_:Str) -> PN = \john -> mkPN ("pn_sg('" + john + "','" + john + "_PN')");
}
