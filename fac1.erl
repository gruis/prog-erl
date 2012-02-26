-module(fac1).
-export([main/1]).
-import(fac, [fac/1]).

main([A]) ->
  I = list_to_integer(atom_to_list(A)),
  io:format("factorial ~w = ~w~n", [I, fac:fac(I)]),
  init:stop().
