#Made by Michał Budnik

using module4list

rysujNnfx(x -> abs(x), -1.0, 1.0, 5, "abs_5")
rysujNnfx(x -> abs(x), -1.0, 1.0, 10, "abs_10")
rysujNnfx(x -> abs(x), -1.0, 1.0, 15, "abs_15")

rysujNnfx(x -> 1/(1+x^2), -5.0, 5.0, 5, "11x2_5")
rysujNnfx(x -> 1/(1+x^2), -5.0, 5.0, 10, "11x2_10")
rysujNnfx(x -> 1/(1+x^2), -5.0, 5.0, 15, "11x2_15")
