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

:- consult(testgrammar_dcg).

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

parse(Tokens) :-
	phrase(complete_sentence(_, _, []/_), Tokens),
	format('OK: ~w~n', [Tokens]),
	!.

parse(Tokens) :-
	format('FAIL: ~w~n', [Tokens]).


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
