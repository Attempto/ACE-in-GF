--# -path=.:../abstract:../common:../../prelude

resource ResAce = ResEng ** open ParadigmsEng in {

  oper

  indefNP : Str -> Gender -> {s : NPCase => Str ; a : Agr} = \smth,g ->
    mkNP smth smth (smth + "'s") singular P3 g ;

}
