-module(shop).
-compile(export_all).
-import(lists, [map/2, sum/1]).
-vsn({0,0,1}).
%%  [A || {vsn,A} <- shop:module_info(attributes)].

cost(oranges)   -> 5;
cost(newspaper) -> 8;
cost(apples)    -> 2;
cost(pears)     -> 9;
cost(milk)      -> 7.


total(L) ->
  sum([cost(I) * N || {I,N} <- L]).

version() -> 
  version([A || {vsn, A} <- module_info(attributes)]).
version([{Maj,Min,Mic}]) -> {Maj,Min,Mic};
version([H|_]) -> version(H).
