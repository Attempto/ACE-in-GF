concrete StructuralAce of Structural =
  StructuralEng - [
    somebody_NP, something_NP,
    everybody_NP, everything_NP,
    nobody_NP, nothing_NP,
    whoPl_IP, whoSg_IP, only_Predet, language_title_Utt, A2] **
--  open MorphoAce, ResAce, ParadigmsAce, MakeStructuralAce, (C = ConstructX), Prelude in {
  open ResAce, ParadigmsAce, Prelude in {

  lin

  somebody_NP = indefNP "somebody" Masc ;
  something_NP = indefNP "something" Neutr ;
  everybody_NP = indefNP "everybody" Masc ;
  everything_NP = indefNP "everything" Neutr ;
  nobody_NP = indefNP "nobody" Masc ;
  nothing_NP = indefNP "nothing" Neutr ;

  -- Replaced "whom" with "who" (KK)
  whoPl_IP = mkIP "who" "who" "whose" plural ; -- Eng: "who" "whom" "whose"
  whoSg_IP = mkIP "who" "who" "whose" singular ; -- Eng: "who" "whom" "whose"

  only_Predet = ss "nothing but" ;

  language_title_Utt = ss "ACE" ;

}
