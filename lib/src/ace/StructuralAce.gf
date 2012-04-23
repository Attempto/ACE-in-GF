concrete StructuralAce of Structural =
  StructuralEng - [whoPl_IP, whoSg_IP, except_Prep, language_title_Utt] **
--  open MorphoAce, ResAce, ParadigmsAce, MakeStructuralAce, (C = ConstructX), Prelude in {
  open ResAce, ParadigmsAce, Prelude in {

  lin

  -- Replaced "whom" with "who"
  whoPl_IP = mkIP "who" "who" "whose" plural ; -- Eng: "who" "whom" "whose"
  whoSg_IP = mkIP "who" "who" "whose" singular ; -- Eng: "who" "whom" "whose"

  -- used in: nothing but
  except_Prep = mkPrep "but" ;
  lin language_title_Utt = ss "ACE" ;

}
