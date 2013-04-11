instance OperAce of Oper =
  ParadigmsEng - [mkA2, mkA2S, mkA2V, prepA2] ** open SyntaxAce, CatAce, ResAce in {

  param AcePnType = defsg | defpl ;

  oper

    -- TODO: this is a hack (note that "variants {}" would not work here)
    -- forms which never occur in the application with this category
    DUMMY : Str = "~" ;
    -- forms which occur in the application with this category, but not with this particular function
    DUMMY2: Str = "~~" ;

    -- In ACE there are only 3 verb forms: infpl, finsg, pp
    -- TODO: there exists probably a cleaner way to do this,
    -- we currently use GF's 5-arg mkV and insert dummy
    -- arguments for forms that we do not need.
    aceV2 = overload {
      aceV2 : (_,_,_:Str) -> V2 = \go,goes,gone -> mkV2 (mkV go goes DUMMY gone DUMMY) ;
      aceV2 : (_,_:Str) -> V2 = \go,goes -> mkV2 (mkV go goes DUMMY DUMMY2 DUMMY) ;
    };


    acePN = overload {
      acePN : (john : Str) -> PN = \john -> mkPN (mkN Neutr (mkN john)) ;
      acePN : Gender -> Str -> PN = \g,john -> mkPN (mkN g (mkN john)) ;
    };


    aceNP = overload {
      aceNP : Str -> SyntaxAce.NP = \john -> SyntaxAce.mkNP (aceN john) ;
      aceNP : AcePnType -> Str -> NP = \t,pn -> case t of {
        defsg => SyntaxAce.mkNP the_Art (aceN pn pn) ;
        defpl => SyntaxAce.mkNP thePl_Det (aceN pn pn)
      } ;
    };


    aceN = overload {
      aceN : (dog : Str) -> CN = aceN_1 nonhuman ;
      aceN : (man,men : Str) -> CN = aceN_2 nonhuman ;
      aceN : Gender -> Str -> CN = aceN_1 ;
      aceN : Gender -> (man,men : Str) -> CN = aceN_2 ;
    };

    aceN_1 : Gender -> Str -> CN = \g,sg -> mkCN (mkN g (mkN sg)) ;
    aceN_2 : Gender -> Str -> Str -> CN = \g,sg,pl -> mkCN (mkN g (mkN sg pl)) ;


  -- Glue preposition to adjective, i.e. "mad_about"
  -- TODO: the same functionality is also in ParadigmsAce, clean this up
  ace_prepA2 : A -> Prep -> A2 ;
  ace_prepA2 a p = lin A2 {
    s = \\aform => (a.s ! aform) + "_" + p.s ;
    c2 = [] -- unused
  };

  ace_A2 : Str -> A2 ;
  ace_A2 str = lin A2 {
    s = \\aform => str ;
    c2 = [] -- unused
  };

  aceA2 : overload {
    aceA2 : A -> Prep -> A2 ; -- absent from
    aceA2 : A -> Str -> A2 ; -- absent "from"
    aceA2 : Str -> Prep -> A2 ; -- "absent" from
    aceA2 : Str -> Str -> A2 ; -- "absent" "from"
    aceA2 : Str -> A2 -- "absent-from"
  } ;

  aceA2 = overload {
    aceA2 : A -> Prep -> A2   = ace_prepA2 ;
    aceA2 : A -> Str -> A2    = \a,p -> ace_prepA2 a (mkPrep p) ;
    aceA2 : Str -> Prep -> A2 = \a,p -> ace_prepA2 (regA a) p;
    aceA2 : Str -> Str -> A2  = \a,p -> ace_prepA2 (regA a) (mkPrep p);
    aceA2 : Str -> A2         = ace_A2 ;
  } ;

}
