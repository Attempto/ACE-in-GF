--# -path=.:../abstract:../../prelude:../common

resource ParadigmsAce = ParadigmsEng ** open CatEng in {

  oper

  -- In ACE there are only 3 verb forms: infpl, finsg, pp
  -- TODO: there exists probably a cleaner way to do this,
  -- we currently use GF's 5-arg mkV and insert dummy
  -- arguments for forms that we do not need.
  aceV2 : (_,_,_:Str) -> V2 = \go,goes,gone -> mkV2 (mkV go goes "~" gone "~") ;

} ;
