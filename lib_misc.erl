-module(lib_misc).
%-export([sum/1, sum/2]).
-compile(export_all).

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

map(C, L) ->
  [C(I) || I <- L].

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

%% Split list into Pivot and T; split T into two lists: those items
%% that are less than Pivot and those that are greater than Pivot. 
%% Call qsort on each list then join the lists with Pivot in the middle.
%%
%% Smaller = [X || X <- T, X < Pivot].
%% Bigger  = [X || X <- T, X >= Pivot].
%% qsort(Smaller) ++ [Pivot] ++ qsort(Bigger).
%%
%% L=[23,6,2,9,27,400,78,45,61,82,14].
%% lib_misc:qsort(L).
%% [2,6,9,14,23,27,45,61,78,82,400]
%% qsort([6,2,9,14]) ++ [23] ++ qsort([27,400,78,45,61,82])
qsort([]) -> [];
qsort([Pivot|T]) ->
  qsort([X || X <- T, X < Pivot])
  ++ [Pivot] ++
  qsort([X || X <- T, X >= Pivot]).
