-module(shop).
-compile(export_all).

cost(oranges)   -> 5;
cost(newspaper) -> 8;
cost(apples)    -> 2;
cost(pears)     -> 9;
cost(milk)      -> 7;

cost({oranges, Cnt})   -> cost(oranges) * Cnt;
cost({newspaper, Cnt}) -> cost(newspaper) * Cnt;
cost({apples, Cnt})    -> cost(apples) * Cnt;
cost({pears, Cnt})     -> cost(pears) * Cnt;
cost({milk, Cnt})      -> cost(milk) * Cnt.

total([Item|Rest]) ->
  cost(Item) + total(Rest);
total([])          -> 0.

version() -> "0.0.1".
