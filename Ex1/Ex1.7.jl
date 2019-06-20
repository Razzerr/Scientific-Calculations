#Coded by: Michał Budnik

function f(x)
    return Float64(sin(x)) + Float64(cos(3*x))
end

function fDer(x)
    return Float64(cos(x)) + Float64(-3*sin(3*x))
end

function approxDerivative(any_func::Function, x0, h)
    return (Float64(f(x0+h)) - Float64(f(x0)))/Float64(h)
end

x0 = 1
for i = 0:54
    result = approxDerivative(f, x0, 2.0^-i)
    print("Val for h = 2 ^ -$i: $result.\n Error: $(fDer(x0) - result)\n\n")
end