concrete RelativeAce of Relative = RelativeEng - [IdRP] ** open ResAce in {

  lin
    -- Changes compared to English:
    --
    -- `whom' -> `who'
    -- `that' in addition to `who' and `which' ('that' is the preferred variant)
    IdRP =
     { s = table {
        RC _ (NCase Gen) | RC _ NPNomPoss => "whose" ;
        RC _ _ => "that" ;
        RPrep _ => "that"
        } ;
      a = RNoAg
      } |
     { s = table {
        RC _ (NCase Gen) | RC _ NPNomPoss => "whose" ;
        RC Neutr _  => "which" ;
        RC _ NPAcc    => "who" ; -- Eng: "whom"
        RC _ (NCase Nom)    => "who" ;
        RPrep Neutr => "which" ;
        RPrep _     => "who" -- Eng: "whom"
        } ;
      a = RNoAg
      }
    ;
}
