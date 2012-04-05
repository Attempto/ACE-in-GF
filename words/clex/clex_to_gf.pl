%
% Converter from the Attempto Parsing Enging lexicon format (Clex)
% into GF English dictionary format.
%
% Work in progress! Only common nouns are covered and the code
% is messy.
%
% TODO:
%
% character escaping
% read input from the command line
% support for variants
%

%clex('/home/kaarel/mywork/APE/lexicon/clex_lexicon.pl').
clex('/home/kaarel/mywork/APE/lexicon/clex_lexicon_small.pl').

type(noun_sg, 'N', 'CN').

gender(human, human).
gender(neutr, nonhuman).
gender(masc, masculine).
gender(fem, feminine).

get_funs(Name, Arity, LemmaPos, LemmasSorted) :-
	functor(Goal, Name, Arity),
	findall(Lemma, (call(Goal), arg(LemmaPos, Goal, Lemma)), Lemmas),
	sort(Lemmas, LemmasSorted).

% TODO: support variants
get_cn(Lemma, Sg, Pl, GfGender) :-
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

format_abstract_cn :-
	get_funs(noun_sg, 3, 2, Lemmas),
	type(noun_sg, T1, T2),
	forall(
		member(L, Lemmas),
		format_abstract(L, T1, T2)
	).

format_concrete_cn :-
	get_funs(noun_sg, 3, 2, Lemmas),
	forall(
		( member(L, Lemmas), get_cn(L, Sg, Pl, Gender) ),
		format_concrete(L, 'N', Sg, Pl, Gender)
	).

format_abstract(Fun, Class, Cat) :-
	replace(char_replacer, Fun, Fun1),
	format("~w_~w : ~w;~n" , [Fun1, Class, Cat]).

format_concrete(Fun, Cat, Sg, Pl, Type) :-
	replace(char_replacer, Fun, Fun1),
	format("lin ~w_~w = mkCN (mkN ~w (mkN \"~w\" \"~w\"));~n" , [Fun1, Cat, Type, Sg, Pl]).

make_clex_abstract(Name) :-
	make_abstract_filename(Name, Filename),
	tell(Filename),
	format_abstract_header(Name),
	format_abstract_cn,
	format_footer,
	told.

make_clex_concrete(Name, Lang) :-
	make_concrete_filename(Name, Lang, Filename),
	tell(Filename),
	format_concrete_header(Name, Lang),
	format_concrete_cn,
	format_footer,
	told.

make_abstract_filename(Name, Filename) :-
	atomic_list_concat([Name, '.gf'], Filename).

make_concrete_filename(Name, Lang, Filename) :-
	atomic_list_concat([Name, Lang, '.gf'], Filename).

format_abstract_header(Name) :-
	format("abstract ~w = Attempto ** {~nfun~n" , [Name]).

format_concrete_header(Name, Lang) :-
	format("concrete ~w~w of ~w = AttemptoAce **~nopen SyntaxAce, ParadigmsAce, IrregAce, (C = ConstructX) in {~n" , [Name, Lang, Name]).

format_footer :-
	format("~n}~n").

r('-', '_').
r('é', 'eacute').
r('è', 'egrave').
r('ê', 'ecircumflex').
r('à', 'agrave').
r('â', 'acircumflex').
r('ç', 'ccedilla').
r('ü', 'uuml').
r('ô', 'ocircumflex').

char_replacer(X, Y) :-
    r(X, Y),
    !.
char_replacer(X, X).

replace(Goal, Atom1, Atom2) :-
	atom_chars(Atom1, Chars1),
	maplist(Goal, Chars1, Atoms2),
	atomic_list_concat(Atoms2, Atom2).

main :-
	clex(Clex),
	consult(Clex),
	make_clex_abstract('Clex'),
	make_clex_concrete('Clex', 'Ace').
