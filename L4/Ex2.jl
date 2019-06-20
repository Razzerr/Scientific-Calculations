#Made by Michał Budnik

function warNewton(x::Array{Float64}, fx::Array{Float64}, t::Float64)
    n = size(fx, 1)
    nt = fx[n]
    for i = n-1:-1:1
        nt = fx[i] + (t - x[i]) * nt
    end
    return nt
end
