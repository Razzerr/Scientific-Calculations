function p(n, r, p_0, T)
    A = fill(T(0.0), n)
    p = T(p_0)
    for i = 1 : n
        p = p + r * p * (T(1.0) - p)
        A[i] = p
    end
    return p, A
end

function p_truncate(n, r, p_0, T)
    A = fill(T(0.0), n)
    p = T(p_0)
    for i = 1 : n
        p = p + r * p * (T(1.0) - p)
        if i == 10
            p = trunc(p, 3)
        end
        A[i] = p
    end
    return p, A
end

println(p(40, 3, 0.01, Float32)[1])
println(p_truncate(40, 3, 0.01, Float32)[1])

A = p(40, 3, 0.01, Float32)[2]
C = p(40, 3, 0.01, Float64)[2]
B = p_truncate(40, 3, 0.01, Float32)[2]

for i  = 1 : size(A)[1]

    println(i, " & ", A[i], " & ", B[i], " & ", C[i]," \\\\")
end

println()
