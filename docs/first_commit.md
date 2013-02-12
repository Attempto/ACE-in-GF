First commit
------------

This project started out as a port of an existing ACE-in-GF implementation.
The first commit was based on the 2011-12-14 version of
the GF darcs repository `examples/attempto/`-directory implemented
by the GF developers in 2009 targeting ACE v6.0. See also the publication:

  K. Angelov and A. Ranta.
	Implementing Controlled Languages in GF.
	N. Fuchs (ed.), CNL-2009 Controlled Natural Languages, LNCS/LNAI 5972, 2010.

This version does not completely match ACE v6.6,
i.e. some ACE constructs are not supported, e.g.
(__(F)__ marks things that the current version has already fixed)

  * __(F)__ transitive adjectives: `mad-about` (`mad about` does not seem to work either)
  * __(F)__ exactly
  * __(F)__ less than
  * __(F)__ everybody
  * __(F)__ everybody X
  * __(F)__ everything
  * __(F)__ somebody X
  * __(F)__ (some|every|no)body who
  * __(F)__ Mary who
  * `which` as a question pronoun
  * __(F)__ `is not` and `isn't` are not equivalent
    * __(F)__ `a woman is not a man .` fails
    * __(F)__ `a woman isn't a man .` succeeds
    * __(F)__ `a woman is not every man .` succeeds
    * __(F)__ `a woman isn't every man .` succeeds
  * __(F)__ `are not` and `aren't` are not equivalent
  * __(F)__ `does not` and `doesn't` are not equivalent
  * __(F)__ `do not` and `don't` are not equivalent
  * __(F)__ `who` (instead of `whom`) in object relative clauses (`a woman who a man sees`)
  * dative shift (`John gives Mary an apple`)
  * __(F)__ `does wait` (as alternative to `waits`)
  * adjective coordination
    - a rich and lucky man waits .
    - John is rich and lucky .
  * John is more rich. (`John is richer` works)
  * John always runs. (`John runs always` works)
  * VP coordination (of both positive and negative VPs) (Note that GF RGL common API supports Conj only with AP, Adv, NP, RS, and S; but there is support for VP coordination in ExtraEng.)
  * __(F)__ negated relative clauses (`that is not`, `that does not`, `that CN is not`)
  * __(F)__ negated WH-questions (`who does not like Mary?`)
  * __(F)__ WH-word in object position (`who does Mary not like ?`)
  * reflexive pronouns (e.g. `itself`)
  * strings and string concatenation
  * lists and sets

and it supports some constructs which in ACE do not exist, have been
deprecated or should be avoided (i.e. create a warning), e.g.

  * relative clause can be attached to any NP using a comma between the NP and the relative clause (in ACE: relative clauses can be used only for nouns, indefinite pronouns and proper names)
  * `he waits .` (and other unresolvable personal pronouns)
  * `the man waits .` (gives a warning in APE)
  * a man X is the man Y .
  * __(F)__ not more than, not at least, ...
  * numbers larger than 12 as words, e.g. `one hundred and thirty`
  * __(F)__ whom
  * __(F)__ such that
  * `- ( X + X ) waits .` (minus sign should be followed by a number)
  * `1 = - -1 .` (`-1` is a built-in GF integer)
  * __(F)__ `nothing except` (instead of `nothing but`)
  * __(F)__ multiple variables in apposition (`a man X X X Y ...`)
  * __(F)__ `there is/are` can take any NP as an argument
  * ...
