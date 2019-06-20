#Written by: Michał Budnik
using rootApproximation;

println(mbisekcji(x -> 3*x - e^x, 0.0, 1.5, 10.0^-4, 10.0^-4))
println(mbisekcji(x -> 3*x - e^x, 1.5, 2.0, 10.0^-4, 10.0^-4))