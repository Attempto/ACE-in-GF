instance OperAce of Oper =
  ParadigmsEng - [mkA2, mkA2S, mkA2V, prepA2] ** open SyntaxAce, CatAce, ResAce in {

  param AcePnType = defsg | defpl ;

  oper

    -- In ACE there are only 3 verb forms: infpl, finsg, pp
    -- TODO: there exists probably a cleaner way to do this,
    -- we currently use GF's 5-arg mkV and insert dummy
    -- arguments for forms that we do not need.
    aceV2 : (_,_,_:Str) -> V2 = \go,goes,gone -> mkV2 (mkV go goes "~" gone "~") ;

    acePN = overload {
      acePN : (john : Str) -> PN = \john -> mkPN (mkN Neutr (mkN john)) ;
      acePN : Gender -> Str -> PN = \g,john -> mkPN (mkN g (mkN john)) ;
    };

    acePND = overload {
      acePND : (john : Str) -> PN = \john -> mkPN (mkN Neutr (mkN ("the" ++ john))) ;
      acePND : Gender -> Str -> PN = \g,john -> mkPN (mkN g (mkN ("the" ++ john))) ;
    };

    -- TODO: do not ignore AcePnType
    aceNP = overload {
      aceNP : (john : Str) -> NP = \john -> SyntaxAce.mkNP (acePN john) ;
      aceNP : AcePnType -> Str -> NP = \_,john -> SyntaxAce.mkNP (acePN ("the" ++ john)) ;
    };

    aceN = overload {
      aceN : (dog : Str) -> CN = aceN_1 nonhuman ;
      aceN : (man,men : Str) -> CN = aceN_2 nonhuman ;
      aceN : Gender -> Str -> CN = aceN_1 ;
      aceN : Gender -> (man,men : Str) -> CN = aceN_2 ;
    };

    aceN_1 : Gender -> Str -> CN = \g,sg -> mkCN (mkN g (mkN sg)) ;
    aceN_2 : Gender -> Str -> Str -> CN = \g,sg,pl -> mkCN (mkN g (mkN sg pl)) ;


  -- Physically glue preposition to adjective, i.e. "mad-about" [JJC]
  ace_prepA2 : A -> Prep -> A2 ;
  ace_prepA2 a p = lin A2 {
    s = \\aform => (a.s ! aform) + "-" + p.s ;
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
