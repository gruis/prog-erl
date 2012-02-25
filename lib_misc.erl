-module(lib_misc).
%-export([sum/1, sum/2]).
-compile(export_all).

sum(L)       -> sum(L, 0).
sum([], N)   -> N;
sum([H|T],N) -> sum(T, H+N).

map(_, [])    -> [];
map(C, [H|T]) -> [map(C, H)|map(C, T)];
map(C, E)     -> C(E).
