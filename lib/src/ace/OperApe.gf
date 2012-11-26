{--

Operators for generating ACE lexicon entries
in the Prolog term format.

--}

-- TODO: how to escape a token-internal quote
-- TODO: maybe expect that the LogicalSymbol is provided via a further parameter
-- or maybe it's possible to access the function name
-- TODO: support other ACE word classes

instance OperApe of Oper = ParadigmsEng - [mkA2, mkA2S, mkA2V, prepA2] ** open SyntaxAce, CatAce, ResAce in {
oper

PN_SG : Str = "pn_sg" ;

NOUN_SG : Str = "noun_sg" ;
NOUN_PL : Str = "noun_pl" ;

TV_FINSG : Str = "tv_finsg" ;
TV_INFPL : Str = "tv_infpl" ;
TV_PP : Str = "tv_pp" ;

ADJ_TR : Str = "adj_tr" ;

DUMMY : Str = "~" ;

-- Mapping of RGL English genders to ACE genders
--
-- ParadigmsEng defines these gender-producing opers:
-- human = Masc ;
-- nonhuman = Neutr ;
-- masculine = Masc ;
-- feminine = Fem ;
--
-- i.e. we cannot generate ACE's "human" nor "undef".

aceGen : Gender -> Str = \g -> case g of {
  Neutr => "neutr";
  Masc => "masc";
  Fem => "fem"
} ;


-- Generates ACE lexicon entries for nouns and proper names,
-- i.e. things that have a gender.
-- Input: predicate name, word form, logical symbol, gender
aceNLex : (_,_,_:Str) -> Gender -> Str = \p,f,l,g -> p + "('" + f + "','" + l + "'," + aceGen g + ")" ;

-- Generates ACE lexicon entries for verbs.
-- Input: predicate name, word form, logical symbol
aceVLex : (_,_,_:Str) -> Str = \p,f,l -> p + "('" + f + "','" + l + "')" ;

-- ACE transitive verbs (V2)
--
-- tv_finsg(ThirdSgForm, LogicalSymbol)
-- tv_infpl(InfForm, LogicalSymbol)
-- tv_pp(PastPartForm, LogicalSymbol)
aceV2 : (_,_,_:Str) -> V2 = \go,goes,gone ->
  let
    l = go + "_V2"
  in
  mkV2 (mkV
    (aceVLex TV_INFPL go l)
    (aceVLex TV_FINSG goes l)
    DUMMY
    (aceVLex TV_PP gone l)
    DUMMY) ;

-- ACE proper names (PN)
--
-- We only cover:
--   pn_sg(WordForm, LogicalSymbol, Gender)
-- and do not cover:
--   pn_pl(WordForm, LogicalSymbol, Gender)
--   pndef_sg(WordForm, LogicalSymbol, Gender)
--   pndef_pl(WordForm, LogicalSymbol, Gender)
acePN = overload {
  acePN : Str -> PN = \john -> mkPN (mkN Neutr (mkN (aceNLex PN_SG john (john + "_PN") Neutr))) ;
  acePN : Gender -> Str -> PN = \g,john -> mkPN (mkN g (mkN (aceNLex PN_SG john (john + "_PN") g))) ;
};


-- ACE common countable nouns (CN)
--
-- noun_sg(SingularForm, LogicalSymbol, Gender)
-- noun_pl(PluralForm, LogicalSymbol, Gender)
aceN = overload {
  aceN : (dog : Str) -> CN = aceN_1 nonhuman ;
  aceN : (man,men : Str) -> CN = aceN_2 nonhuman ;
  aceN : Gender -> Str -> CN = aceN_1 ;
  aceN : Gender -> (man,men : Str) -> CN = aceN_2 ;
};

aceN_1 : Gender -> Str -> CN = \g,sg -> mkCN (mkAceNoun g (mkN sg)) ;
aceN_2 : Gender -> Str -> Str -> CN = \g,sg,pl -> mkCN (mkAceNoun g (mkN sg pl)) ;

-- Modifies the internal noun structure to replace the
-- initially generated word forms with ACE lexicon entries.
-- TODO: genitive generation is not quite correct, it always adds "'s"
mkAceNoun : Gender -> N -> N ;
mkAceNoun g n =
  let
    sg = n.s ! Sg ! Nom ;
    pl = n.s ! Pl ! Nom ;
    l = (n.s ! Sg ! Nom) + "_N" ;
  in
    lin N {
      s = table {
        Sg => table {
          Gen => (aceNLex NOUN_SG sg l g) ++ "'s" ;
          _ => (aceNLex NOUN_SG sg l g)
          } ;
        Pl => table {
          Gen => (aceNLex NOUN_PL pl l g) ++ "'s" ;
          _ => (aceNLex NOUN_PL pl l g)
          }
        } ; g=g} ;


-- ACE transitive adjectives (A2)
--
-- We only cover:
--   adj_tr(PositiveForm, LogicalSymbol, Preposition)
-- and do not cover:
--   adj_tr_comp(ComparativeForm, LogicalSymbol, Preposition)
--   adj_tr_sup(SuperlativeForm, LogicalSymbol, Preposition)

-- Physically glue preposition to adjective, i.e. "mad-about" [JJC]
ace_prepA2 : A -> Prep -> A2 ;
ace_prepA2 a p = lin A2 {
  s = \\aform => ADJ_TR + "('" + (a.s ! aform) + "-" + p.s + "','" + (a.s ! aform) + "-" + p.s + "_A2','" + p.s + "')" ;
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
