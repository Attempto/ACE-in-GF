--concrete NounAce of Noun = CatAce ** open MorphoAce, ResAce, Prelude in {
concrete NounAce of Noun = NounEng - [RelNP] ** {

  flags optimize=all_subs ;

  lin

    -- In GF English, a comma separates an NP and its relative clause.
    -- Note that one could also attach a relative clause to a CN, without a comma.
    -- So the comma makes sure that we get an unambiguous parse.
    -- In ACE, we do not have such a comma. (KK)
    RelNP np rs = {
      s = \\c => np.s ! c ++ rs.s ! np.a ;
      a = np.a
      } ;

}
