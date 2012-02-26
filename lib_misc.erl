-module(lib_misc).
%-export([sum/1, sum/2]).
-compile(export_all).

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

map(C, L) ->
  [C(I) || I <- L].

%% Filter using case statements
filter(_, []) -> [];
filter(C, [H|T]) -> 
  case C(H) of
    true  -> [H|filter(C,T)];
    false -> filter(C,T)
  end.

%% Filter using if statements
filter2(_, []) -> [];
filter2(C, [H|T]) ->
  Val = C(H),
  if Val  ->
        [H|filter2(C,T)];
     true ->
        filter2(C,T)
  end.

%% Filter using list comprehension
filter3(C, L) ->
  [X || X <- L, C(X)].

% filter4(C, [H|T]) when C(H) -> [H|filter4(T)];
% filter4(C, [H|T]) -> filter4(C,T).


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

pythag(N) ->
  [ {A,B,C} || 
      A <- lists:seq(1,N),
      B <- lists:seq(1,N),
      C <- lists:seq(1,N),
      A + B + C =< N,
      A*A+B*B =:= C*C
  ].

perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].


%% If X is greater than Y then X is the max. If not then the first 
%% clause will not match, so the answer is Y.
max(X,Y) when X > Y -> X;
max(_,Y) -> Y.


%% Split a list into two, one with even numbers the other with odd numbers.
%% Each list will be in reverse order.
%%  56> lib_misc:odds_and_evens([1,2,3,4]).
%%  {[3,1],[4,2]}
%%  57> (fun({X,Y}) -> {lists:reverse(X), lists:reverse(Y)} end)(lib_misc:odds_and_evens([1,2,3,4])).
%%  {[1,3],[2,4]}
odds_and_evens(L) ->
  odds_and_evens(L, [], []).
odds_and_evens([H|T], Odds, Evens) ->
  case (H rem 2) of
    0 -> odds_and_evens(T, Odds, [H|Evens]);
    1 -> odds_and_evens(T, [H|Odds], Evens)
  end;
odds_and_evens([], Odds, Evens) ->
  {Odds, Evens}.

sqrt(X) when X < 0 ->
  erlang:error({squareRootNegativeArgument, X});
sqrt(X) -> math:sqrt(X).
