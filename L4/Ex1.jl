#Made by Michał Budnik

function ilorazyRoznicowe(x::Array{Float64}, f::Array{Float64})
    n = size(x,1)
    fx = Array{Float64}(n)
    for i = 1:n
        fx[i] = f[i]
    end
    for i = 1:n
        for j = n:-1:i+1
            fx[j] = (fx[j]-fx[j-1])/(x[j] - x[j-i])
        end
    end
    return fx
end