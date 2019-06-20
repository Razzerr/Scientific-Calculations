#Written by: Michał Budnik
using rootApproximation;

function f(x)
    return sin(x);
end
function pf(x)
    return cos(x);
end

a = -0.5;
b = 0.5;
delta = 10.0^-5
epsilon = 10.0^-5
maxit = 50

function testBisekcji()
    result = mbisekcji(x -> f(x), a, b, delta, epsilon);
    if (result[4] == 0 && (result[1] < delta || result[2] < epsilon)) println("Test bisekcji: Zaliczony");
    else println("Test bisekcji: Błąd!");
    end
end

function testStycznych()
    result = mstycznych(x -> f(x), x -> pf(x), a, delta, epsilon, maxit);
    if (result[4] == 0 && (result[1] < delta || result[2] < epsilon)) println("Test stycznych: Zaliczony");
    else println("Test stycznych: Błąd!");
    end
end

function testSiecznych()
    result = msiecznych(x -> f(x), a, b, delta, epsilon, maxit);
    if (result[4] == 0 && (result[1] < delta || result[2] < epsilon)) println("Test siecznych: Zaliczony");
    else println("Test siecznych: Błąd!");
    end
end

testBisekcji();
testStycznych();
testSiecznych();