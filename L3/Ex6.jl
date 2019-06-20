#Written by: Michał Budnik
using rootApproximation;
function f1(x)
    return (e^(1-x)-1)
end

function f2(x)
    return (x*e^(-x))
end

function pf1(x)
    return (-e^(1-x))
end

function pf2(x)
    return (e^(-x) - x*e^(-x))
end

println("Miejsce zerowe f1 metoda bisekcji : $(mbisekcji(x -> f1(x), 0.0, 1.9, 10.0^-5, 10.0^-5))")
println("Miejsce zerowe f1 metoda newtona  : $(mstycznych(x -> f1(x), x -> pf1(x), 2.0, 10.0^-5, 10.0^-5, 50))")
println("Miejsce zerowe f1 metoda siecznych: $(msiecznych(x -> f1(x), 0.0, 2.0, 10.0^-5, 10.0^-5, 50))")
println("--------------")
println("Miejsce zerowe f2 metoda bisekcji : $(mbisekcji(x -> f2(x), -1.0, 1.9, 10.0^-5, 10.0^-5))")
println("Miejsce zerowe f2 metoda newtona  : $(mstycznych(x -> f2(x), x -> pf2(x), -1.0, 10.0^-5, 10.0^-5, 50))")
println("Miejsce zerowe f2 metoda siecznych: $(msiecznych(x -> f2(x), -1.0, 1.0, 10.0^-5, 10.0^-5, 50))")
println("--------------")
println("F1: metoda newtona dla x0 > 1  : $(mstycznych(x -> f1(x), x -> pf1(x), 100.1, 10.0^-5, 10.0^-5, 100))")
println("F2: metoda newtona dla x0 > 1  : $(mstycznych(x -> f2(x), x -> pf2(x), 3.0, 10.0^-5, 10.0^-5, 50))")
println("F2: metoda newtona dla x0 = 1  : $(mstycznych(x -> f2(x), x -> pf2(x), 1.0, 10.0^-5, 10.0^-5, 50))")