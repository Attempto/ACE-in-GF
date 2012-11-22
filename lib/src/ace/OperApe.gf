-- TODO: how to escape a token-internal quote
-- TODO: maybe expect that the LogicalSymbol is provided via a further parameter
-- or maybe it's possible to access the function name

instance OperApe of Oper = ParadigmsEng - [mkA2, mkA2S, mkA2V, prepA2] ** open SyntaxAce, CatAce, ResAce in {
oper


-- Mapping of RGL English genders to ACE genders
--
-- ParadigmsEng defines these gender-producing opers:
-- human = Masc ;
-- nonhuman = Neutr ;
-- masculine = Masc ;
-- feminine = Fem ;

-- i.e. we cannot generate ACE's "human" nor "undef".

aceGen : Gender -> Str = \g -> case g of {
  Neutr => "neutr";
  Masc => "masc";
  Fem => "fem"
} ;

aceNLex : (_,_,_:Str) -> Gender -> Str = \p,sg,l,g -> p + "('" + sg + "','" + l + "'," + aceGen g + ")" ;

-- tv_finsg(ThirdSgForm, LogicalSymbol).
-- tv_infpl(InfForm, LogicalSymbol).
-- tv_pp(PastPartForm, LogicalSymbol).
aceV2 : (_,_,_:Str) -> V2 = \go,goes,gone -> mkV2 (mkV
  ("tv_finsg('" + go + "','" + go + "_V2')")
  ("tv_infpl('" + goes + "','" + go + "_V2')")
  "~"
  ("tv_pp('" + gone + "','" + go + "_V2')")
  "~") ;

-- We only cover:
--   pn_sg(WordForm, LogicalSymbol, Gender).
-- and do not cover:
--   pn_pl(WordForm, LogicalSymbol, Gender).
--   pndef_sg(WordForm, LogicalSymbol, Gender).
--   pndef_pl(WordForm, LogicalSymbol, Gender).
acePN = overload {
  acePN : Str -> PN = \john -> mkPN (mkN Neutr (mkN (aceNLex "pn_sg" john (john + "_PN") Neutr))) ;
  acePN : Gender -> Str -> PN = \g,john -> mkPN (mkN g (mkN (aceNLex "pn_sg" john (john + "_PN") g))) ;
};


-- noun_sg(SingularForm, LogicalSymbol, Gender).
-- noun_pl(PluralForm, LogicalSymbol, Gender).
aceN = overload {
  aceN : (dog : Str) -> CN = aceN_1 nonhuman ;
  aceN : (man,men : Str) -> CN = aceN_2 nonhuman ;
  aceN : Gender -> Str -> CN = aceN_1 ;
  aceN : Gender -> (man,men : Str) -> CN = aceN_2 ;
};

aceN_1 : Gender -> Str -> CN = \g,sg -> mkCN (mkN g (mkN sg)) ; -- TODO
aceN_2 : Gender -> Str -> Str -> CN = \g,sg,pl -> mkCN (mkN g (mkN (aceNLex "noun_sg" sg pl g) (aceNLex "noun_pl" pl pl g))) ;



-- We only cover:
--   adj_tr(PositiveForm, LogicalSymbol, Preposition).
-- and do not cover:
--   adj_tr_comp(ComparativeForm, LogicalSymbol, Preposition).
--   adj_tr_sup(SuperlativeForm, LogicalSymbol, Preposition).

-- Physically glue preposition to adjective, i.e. "mad-about" [JJC]
-- s = \\aform => (a.s ! aform) + "-" + p.s ;
ace_prepA2 : A -> Prep -> A2 ;
ace_prepA2 a p = lin A2 {
  s = \\aform => "adj_tr('" + (a.s ! aform) + "-" + p.s + "','" + (a.s ! aform) + "-" + p.s + "_A2','" + p.s + "')" ;
  c2 = [] -- unused
};

-- Copy from Eng, since they use custom prepA2 above [JJC]
aceA2 : overload {
  aceA2 : A -> Prep -> A2 ; -- absent from
  aceA2 : A -> Str -> A2 ; -- absent from --%
  aceA2 : Str -> Prep -> A2 ; -- absent from --%
  aceA2 : Str -> Str -> A2 -- absent from --%
} ;


aceA2 = overload {
  aceA2 : A -> Prep -> A2   = ace_prepA2 ;
  aceA2 : A -> Str -> A2    = \a,p -> ace_prepA2 a (mkPrep p) ;
  aceA2 : Str -> Prep -> A2 = \a,p -> ace_prepA2 (regA a) p;
  aceA2 : Str -> Str -> A2  = \a,p -> ace_prepA2 (regA a) (mkPrep p);
} ;

}
