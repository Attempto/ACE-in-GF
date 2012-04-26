concrete RelativeAce of Relative = RelativeEng - [IdRP] ** open ResAce in {

  lin
    -- Replaced `whom' with `who' (KK)
    --
    -- Added `that' in addition to `who' and `which' (KK)
    IdRP =
     { s = table {
        RC _ (NCase Gen) => "whose" ;
        RC Neutr _  => "which" ;
        RC _ NPAcc    => "who" ; -- Eng: "whom"
        RC _ (NCase Nom)    => "who" ;
        RPrep Neutr => "which" ;
        RPrep _     => "who" -- Eng: "whom"
        } ;
      a = RNoAg
      } |
     { s = table {
        RC _ (NCase Gen) => "whose" ;
        RC _ _ => "that" ;
        RPrep _ => "that"
        } ;
      a = RNoAg
      }
    ;
}
