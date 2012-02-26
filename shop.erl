-module(shop).
-compile(export_all).
-import(lists, [map/2, sum/1]).

cost(oranges)   -> 5;
cost(newspaper) -> 8;
cost(apples)    -> 2;
cost(pears)     -> 9;
cost(milk)      -> 7.


total(L) ->
  sum(map(fun({Item, N}) -> cost(Item) * N end, L)).

version() -> "0.0.1".
