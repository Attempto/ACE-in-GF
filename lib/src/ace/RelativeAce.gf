concrete RelativeAce of Relative = RelativeEng - [IdRP] ** open ResAce in {

  lin
    -- Replaced "whom" with "who" (KK)
    --
    -- Simplified the selection of the relative pronoun.
    -- This overgenerates with respect to ACE, but for the time being
    -- it's OK like this.
    -- Maybe it's possible to write it more compactly, but moving the
    -- variant into the table as e.g. `RC _ _ => "who" | "which" | "that"`
    -- led to very slow (or infinitely long?) compilation of PGF. (KK)
    IdRP = 
     { s = table {
        RC _ (NCase Gen) => "whose" ;
        RC _ _ => "who" ;
        RPrep _ => "who"
        } ;
      a = RNoAg
      } |
     { s = table {
        RC _ (NCase Gen) => "whose" ;
        RC _ _ => "which" ;
        RPrep _ => "which"
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

-- This is the old version, modeled after the English RG.
{-
        RC _ (NCase Gen) => "whose" ; 
        RC Neutr _  => "which" ;
        RC _ NPAcc    => "who" ; -- Eng: "whom"
        RC _ (NCase Nom)    => "who" ;
        RPrep Neutr => "which" ;
        RPrep _     => "who" -- Eng: "whom"
-}
}
