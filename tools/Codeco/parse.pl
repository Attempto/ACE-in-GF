% Parses lines from STDIN.
% Requires SWI-Prolog (tested with v6.0.0).
%
% NB: Very preliminary!
%
% Usage:
%
% > echo "Mary is a friend of Mary ." | swipl -f parse.pl -g main -t halt -q
% OK: [Mary,is,a,friend of,Mary,.]
%
% Author: Kaarel Kaljurand
% Version: 2012-05-05

% The readutil-library provides 'read_line_to_codes'.
% According to the SWI-Prolog manual, the predicates of this library
% perform better if the clib-package is installed because in this case
% the C implementation of these predicates is used.
:- use_module(library(readutil)).

% The encoding of this file.
:- encoding(utf8).

% The default encoding of text-streams.
:- set_prolog_flag(encoding, utf8).

:- style_check(-singleton).
:- consult(grammar_dcg).
:- style_check(+singleton).

main :-
	prompt(_, ''),
	%set_stream_encoding(user_input, utf8),
	%set_stream_encoding(user_output, utf8),
	main_loop.

main_loop :-
	read_line_to_codes(user_input, Codes),
	Codes \= end_of_file,
	phrase(tokens(Tokens), Codes),
	parse(Tokens),
	main_loop ; true.

% We don't care if there are multiple parses,
% but there shouldn't be anyway.
parse(Tokens) :-
	phrase(text(_, _, []/_), Tokens),
	!,
	format_tokens('OK', Tokens).

parse(Tokens) :-
	format_tokens('FAIL', Tokens).


% There must always be whitespace between two tokens.
tokens([]) --> [].
tokens([T]) --> token(T).
tokens([T1, T2 | Ts]) -->
	ws(_), token(T1), ws(1),
	!,
	tokens([T2 | Ts]).


ws(1) --> [C], { code_type(C, space) }, ws(_).
ws(0) --> [].


token('asked by') --> "asked by".
token('friend of') --> "friend of".
token('the woman') --> "the woman".
token('at least') --> "at least".
token('at most') --> "at most".
token('more than') --> "more than".
token('less than') --> "less than".
token('it is false that') --> "it is false that".
token('there is') --> "there is".
token('there are') --> "there are".
token('for every') --> "for every".
token('does not') --> "does not".
token('do not') --> "do not".
token('is not') --> "is not".
token('are not') --> "are not".
token(T) --> word(T).

word(Word) --> letters([C | Cs]), { atom_codes(Word, [C | Cs]) }.

letters([C | Cs]) --> letter(C), letters(Cs).
letters([]) --> [].

% letter//1 consumes possibly several codes rewriting them into a single code.
letter(C) --> [C], { \+ code_type(C, space) }.


%% set_stream_encoding(+Stream, +Enc)
%
% Sets the encoding of the given stream.
%
% @param Enc is in {utf8, ...}
%
set_stream_encoding(Stream, Enc) :-
	set_stream(Stream, encoding(Enc)).


format_tokens(Tag, Tokens) :-
	atomic_list_concat(Tokens, '  ', TokensAsAtom),
	format('~w: ~w~n', [Tag, TokensAsAtom]).
