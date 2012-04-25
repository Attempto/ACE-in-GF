--# -path=.:../abstract:../../prelude:../common

resource ParadigmsAce = ParadigmsEng - [mkA2, mkA2S, mkA2V, prepA2] ** open CatAce, ResAce in {

  oper

  -- In ACE there are only 3 verb forms: infpl, finsg, pp
  -- TODO: there exists probably a cleaner way to do this,
  -- we currently use GF's 5-arg mkV and insert dummy
  -- arguments for forms that we do not need.
  aceV2 : (_,_,_:Str) -> V2 = \go,goes,gone -> mkV2 (mkV go goes "~" gone "~") ;

  prepA2 : A -> Prep -> A2 ;
--  prepA2 a p = lin A2 (a ** {c2 = p.s}) ; -- physically attach mad-about
  prepA2 a p = lin A2 {
    s = \\aform => (a.s ! aform) + "-" + p.s
  };

  -- Copy from Eng
  mkA2 : overload {
    mkA2 : A -> Prep -> A2 ; -- absent from 
    mkA2 : A -> Str -> A2 ; -- absent from --%
    mkA2 : Str -> Prep -> A2 ; -- absent from --%
    mkA2 : Str -> Str -> A2 -- absent from --%

  } ;
  -- mkA2S : A -> Prep -> A2S ; --%
  -- mkA2V : A -> Prep -> A2V ; --%

  mkA2 = overload {
    mkA2 : A -> Prep -> A2   = prepA2 ;
    mkA2 : A -> Str -> A2    = \a,p -> prepA2 a (mkPrep p) ;
    mkA2 : Str -> Prep -> A2 = \a,p -> prepA2 (regA a) p;
    mkA2 : Str -> Str -> A2  = \a,p -> prepA2 (regA a) (mkPrep p);
  } ;
  -- mkA2S v p = lin A (prepA2 v p) ;
  -- mkA2V v p = prepA2 v p ;


} ;
