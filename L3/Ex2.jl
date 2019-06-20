#Written by: Michał Budnik
function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    v = f(x0)
    if (abs(v) < epsilon)
        return (x0, v, 0, 0);
    end
    for i in 1:maxit
        if (abs(pf(x0)) < epsilon)
            return (x0, v, 0, 2);
        end
        x1 = x0 - (v/pf(x0));
        v = f(x1);
        if (abs(x1-x0) < delta || abs(v) < epsilon)
            return (x1, v, i, 0);
        end
        x0 = x1;
    end
    return (x0, v, maxit, 1);
end