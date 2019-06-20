#Written by: Michał Budnik
function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    fx0 = f(x0);
    fx1 = f(x1);
    for i in 1:maxit
        if (abs(fx0) > abs(fx1))
            temp = x0;
            x0 = x1;
            x1 = temp;
            temp = fx0;
            fx0 = fx1;
            fx1 = temp;
        end
        s = (x1 - x0)/(fx1 - fx0);
        x1 = x0;
        fx1 = fx0;
        x0 = x0 - fx0*s;
        fx0 = f(x0);
        if (abs(x1-x0) < delta || abs(fx0) < epsilon)
            return (x0, fx0, i, 0);
        end
    end
    return (x0, fx0, maxit, 1);
end