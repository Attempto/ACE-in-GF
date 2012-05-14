%
% Converter from the Attempto Parsing Enging lexicon format (Clex)
% into GF English dictionary format. The output is saved into
% Clex.gf and ClexAce.gf.
%
% Kaarel Kaljurand
% 2012-04-06
%
% Usage:
%
% clex='/home/kaarel/mywork/APE/lexicon/clex_lexicon_small.pl'
% swipl -f none -g "main('$clex')" -t halt -s clex_to_gf.pl
%
% TODO:
%
%  - support for variants
%  - complete character escaping
%  - read input from the command line
%  - support GF's VS (e.g. `believe')
%  - support all the wordforms that Clex provides, i.e. do not
%    rely on GF's smart paradigms
%

type(Type) :-
	type(Type, _, _, _, _, _).

type(X, Y, Z) :-
	type(X, _, _, Y, Z).

type(X1, X2, X3, X4, X5) :-
	type(X1, X2, X3, X4, X5, _).

type(
	adj_itr,
	2,
	2,
	'A',
	'A',
	get_adj_itr
).

type(
	adj_tr,
	3,
	2,
	'A2',
	'A2',
	get_adj_tr
).

type(
	noun_sg,
	3,
	2,
	'N',
	'CN',
	get_noun
).

type(
	noun_mass,
	3,
	2,
	'MCN',
	'MCN',
	get_noun_mass
).

type(
	mn_sg,
	2,
	2,
	'Unit',
	'Unit',
	get_mn
).

type(
	pn_sg,
	3,
	2,
	'PN',
	'PN',
	get_pn
).


type(
	iv_finsg,
	2,
	2,
	'V',
	'V',
	get_iv
).


type(
	tv_finsg,
	2,
	2,
	'V2',
	'V2',
	get_tv
).

type(
	dv_finsg,
	3,
	2,
	'V3',
	'V3',
	get_dv
).

type(
	adv,
	2,
	2,
	'Adv',
	'Adv',
	get_adv
).

type(
	prep,
	2,
	2,
	'Prep',
	'Prep',
	get_prep
).


% Maps ACE gender to GF Eng gender
gender(human, human).
gender(neutr, nonhuman).
gender(masc, masculine).
gender(fem, feminine).

% Returns a unique list of lemmas of the given type
get_funs(Name, Arity, LemmaPos, LemmasSorted) :-
	functor(Goal, Name, Arity),
	findall(Lemma, (call(Goal), arg(LemmaPos, Goal, Lemma)), Lemmas),
	sort(Lemmas, LemmasSorted).

get_adj_itr(Lemma, "aceA \"~w\" \"~w\" \"~w\"", [Adj, Comp, Sup]) :-
	adj_itr(Adj, Lemma),
	adj_itr_comp(Comp, Lemma),
	adj_itr_sup(Sup, Lemma),
	!.

get_adj_itr(Lemma, "mkA \"~w\" \"~w\"", [Adj, Comp]) :-
	adj_itr(Adj, Lemma),
	adj_itr_comp(Comp, Lemma),
	!.

get_adj_itr(Lemma, "mkA \"~w\"", [Adj]) :-
	adj_itr(Adj, Lemma),
	!.

% TODO: provide comp and sup
get_adj_tr(Lemma, "aceA2 \"~w\" \"~w\" \"~w\"", [Adj, Comp, Sup]) :-
	adj_tr(Adj, Lemma, Prep),
	adj_tr_comp(Comp, Lemma, Prep),
	adj_tr_sup(Sup, Lemma, Prep),
	!.

% TODO: support variants
get_noun(Lemma, "mkCN (mkN ~w (mkN \"~w\" \"~w\"))", [GfGender, Sg, Pl]) :-
	noun_sg(Sg, Lemma, AceGender),
	(
		noun_pl(Pl1, Lemma, _)
	->
		Pl = Pl1
	;
		Pl = Sg
	),
	gender(AceGender, GfGender),
	!.

get_noun_mass(Lemma, "mkCN (mkN ~w (mkN \"~w\" \"~w\"))", [GfGender, Word, Word]) :-
	noun_mass(Word, Lemma, AceGender),
	gender(AceGender, GfGender),
	!.

% TODO: support mn_pl
get_mn(Lemma, "mkCN (mkN ~w (mkN \"~w\" \"~w\"))", [nonhuman, Word, Word]) :-
	mn_sg(Word, Lemma),
	!.

% TODO: support pn_pl, gender, and the the-variant
get_pn(Lemma, "mkPN \"~w\"", [Word]) :-
	pn_sg(W1, Lemma, _),
	(
		pndef_sg(_W2, Lemma, _)
	->
		%atom_concat('the ', W2, TheW2),
		%atomic_list_concat([W1, '|', TheW2], Word)
		Word = W1
	;
		Word = W1
	),
	!.


get_iv(Lemma, "aceV \"~w\" \"~w\"", [Inf, Fin]) :-
	iv_infpl(Inf, Lemma),
	iv_finsg(Fin, Lemma),
	!.

get_iv(Lemma, "mkV \"~w\"", [Word]) :-
	iv_infpl(Word, Lemma),
	!.


get_tv(Lemma, "aceV2 \"~w\" \"~w\" \"~w\"", [Inf, Fin, Pp]) :-
	tv_infpl(Inf, Lemma),
	tv_finsg(Fin, Lemma),
	tv_pp(Pp, Lemma),
	!.

get_tv(Lemma, "mkV2 \"~w\"", [Word]) :-
	tv_infpl(Word, Lemma),
	!.

get_dv(Lemma, "aceV3 \"~w\" \"~w\" \"~w\" \"~w\"", [Inf, Fin, Pp, Prep]) :-
	dv_infpl(Inf, Lemma, Prep),
	Prep == '',
	dv_finsg(Fin, Lemma, Prep),
	dv_pp(Pp, Lemma, Prep),
	!.

get_dv(Lemma, "mkV3 (mkV \"~w\") (mkPrep \"~w\")", [Word, Prep]) :-
	dv_infpl(Word, Lemma, Prep),
	!.

% TODO:
% mkAdV (capital V) makes adverbs which can precede the verb, which we need,
% but didn't get it to work, got an error message:
% linking ... gf: GrammarToPGF.mkFId failed
%
% TODO: the comp and sup forms cannot be specified in the GF API?
get_adv(Lemma, "mkAdv \"~w\"", [Word]) :-
	adv(Word, Lemma),
	!.

get_prep(Lemma, "mkPrep \"~w\"", [Word]) :-
	prep(Word, Lemma),
	!.


format_abstract_fun(Name, Arity, LemmaPos) :-
	get_funs(Name, Arity, LemmaPos, Lemmas),
	type(Name, T1, T2),
	forall(
		pick_lemma(Lemmas, T2, L),
		format_abstract(L, T1, T2)
	).

% TODO: have_V2 was in Attempto.gf, so we cannot generate it here.
% Maybe it should not be in Attempto.gf?
pick_lemma(Lemmas, Cat, L) :-
	member(L, Lemmas),
	\+ L-Cat == have-'V2'.

format_concrete_fun(Type) :-
	type(Type, Arity, LemmaPos, T, Cat, Morph),
	get_funs(Type, Arity, LemmaPos, Lemmas),
	forall(
		( pick_lemma(Lemmas, Cat, L), call(Morph, L, Format, Args) ),
		format_concrete(L, T, Format, Args)
	).

format_abstract(Fun, Class, Cat) :-
	replace(char_replacer, Fun, Fun1),
	format("~w_~w : ~w;~n", [Fun1, Class, Cat]).

format_concrete(Fun, T, MorphFormat, Args) :-
	replace(char_replacer, Fun, Fun1),
	append(["lin ~w_~w = ", MorphFormat, ";~n"], Format),
	format(Format, [Fun1, T | Args]).

make_clex_abstract(Name) :-
	make_abstract_filename(Name, Filename),
	tell(Filename),
	format_abstract_header(Name),
	forall(
		type(FunName, Arity, LemmaPos, _, _),
		format_abstract_fun(FunName, Arity, LemmaPos)
	),
	format_footer,
	told.

make_clex_concrete(Name, Lang) :-
	make_concrete_filename(Name, Lang, Filename),
	tell(Filename),
	format_concrete_header(Name, Lang),
	forall(
		type(Type),
		format_concrete_fun(Type)
	),
	format_footer,
	told.

make_abstract_filename(Name, Filename) :-
	atomic_list_concat([Name, '.gf'], Filename).

make_concrete_filename(Name, Lang, Filename) :-
	atomic_list_concat([Name, Lang, '.gf'], Filename).

format_abstract_header(Name) :-
	format("abstract ~w = ACE ** {~nfun~n" , [Name]).

% The GF's non-smart input for mkA is
% \good,better,best,well
:- style_check(-atom).
format_concrete_header(Name, Lang) :-
	format("concrete ~w~w of ~w = ACEAce ** open SyntaxAce, ParadigmsAce in {~n", [Name, Lang, Name]),
	write('
flags coding=utf8;
oper
aceV : (_,_:Str) -> V = \\go,goes -> mkV go goes "~" "~" "~";
aceV2 : (_,_,_:Str) -> V2 = \\go,goes,gone -> mkV2 (mkV go goes "~" gone "~");
aceV3 : (_,_,_,_:Str) -> V3 = \\go,goes,gone,prep -> mkV3 (mkV go goes "~" gone "~") (mkPrep prep);
aceA : (_,_,_:Str) -> A = \\good,better,best -> mkA good better best "~";
aceA2 : (_,_,_:Str) -> A2 = \\good,better,best -> mkA2 (aceA good better best) "";
').
:- style_check(+atom).

format_footer :-
	format("}~n").

r('-', '_').
r('é', 'eacute').
r('è', 'egrave').
r('ê', 'ecircumflex').
r('à', 'agrave').
r('â', 'acircumflex').
r('ç', 'ccedilla').
r('ü', 'uuml').
r('ô', 'ocircumflex').
r('°', 'degree').
r('ï', 'iuml').

char_replacer(X, Y) :-
    r(X, Y),
    !.
char_replacer(X, X).

replace(Goal, Atom1, Atom2) :-
	atom_chars(Atom1, Chars1),
	maplist(Goal, Chars1, Atoms2),
	atomic_list_concat(Atoms2, Atom2).

main(Clex) :-
	consult(Clex),
	make_clex_abstract('Clex'),
	make_clex_concrete('Clex', 'Ace').
