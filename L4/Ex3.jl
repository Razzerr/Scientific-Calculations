#Made by Michał Budnik

function naturalna(x::Array{Float64}, fx::Array{Float64}) 
    n = length(fx)
    a = Array{Float64}(n)
    a[n] = fx[n] 
    for i = n-1:-1:1 
        a[i] = fx[i]
        for j = i:n-1
            a[j] = a[j] - x[i] * a[j+1]
        end
    end
    return a
end