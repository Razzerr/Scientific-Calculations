#Written by: Michał Budnik
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    u = f(a);
    v = f(b);
    e = b - a;
    if (sign(u) == sign(v))
        return (a+e, f(a+e), 0, 1);
    end
    it = 0
    while (true)
        e = e/2;
        c = a + e;
        w = f(c);
        it += 1;
        if (abs(e) < delta || abs(w) < epsilon)
            return (c, w, it, 0)
        end
        if (sign(w) != sign(u))
            b = c;
            v = w;
        else
            a = c;
            u = w;
        end
    end
end