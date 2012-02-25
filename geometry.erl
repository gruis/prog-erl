-module(geometry).
-export([area/1]).

area({rectangle, Width, Ht}) -> Width * Ht;
area({circle, R}) -> 3.1459 * R * R;
area({square, X}) -> X * X.
