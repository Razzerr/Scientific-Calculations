#Written by: Michał Budnik
using rootApproximation;
function f(x)
    return (sin(x)-(0.5*x)^2);
end

function pf(x)
    return (cos(x)-(0.5*x));
end

println("Metoda bisekcji : $(mbisekcji(x -> f(x), 1.5, 2.0, 0.5*(10.0^-5), 0.5*(10.0^-5)))")
println("Metoda newtona  : $(mstycznych(x -> f(x), x -> pf(x), 1.5, 0.5*(10.0^-5), 0.5*(10.0^-5), 50))")
println("Metoda siecznych: $(msiecznych(x -> f(x), 1.0, 2.0, 0.5*(10.0^-5), 0.5*(10.0^-5), 50))")