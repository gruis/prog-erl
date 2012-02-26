-module(lib_misc).
%-export([sum/1, sum/2]).
-compile(export_all).

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

map(_, [])    -> [];
map(C, [H|T]) -> [C(H)|map(C, T)].


filter(_, []) -> [];
filter(C, [H|T]) -> 
  case C(H) of
    true  -> [H|filter(C,T)];
    false -> filter(C,T)
  end.


filter2(_, []) -> [];
filter2(C, [H|T]) ->
  Val = C(H),
  if Val  ->
        [H|filter2(C,T)];
     true ->
        filter2(C,T)
  end.
