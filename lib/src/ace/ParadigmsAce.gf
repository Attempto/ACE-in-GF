--# -path=.:../abstract:../../prelude:../common

resource ParadigmsAce = ParadigmsEng - [mkA2, mkA2S, mkA2V, prepA2] ** open CatAce, ResAce in {

  oper

  -- Physically glue preposition to adjective, i.e. "mad-about" [JJC]
  prepA2 : A -> Prep -> A2 ;
  prepA2 a p = lin A2 {
    s = \\aform => (a.s ! aform) + "-" + p.s ;
    c2 = [] -- unused
  };

  -- Copy from Eng, since they use custom prepA2 above [JJC]
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
