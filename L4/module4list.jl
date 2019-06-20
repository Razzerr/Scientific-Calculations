#Written by: Michał Budnik
module module4list  
    using Plots
    gr()
    export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx

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

    function warNewton(x::Array{Float64}, fx::Array{Float64}, t::Float64)
        n = size(fx, 1)
        nt = fx[n]
        for i = n-1:-1:1
            nt = fx[i] + (t - x[i]) * nt
        end
        return nt
    end
    

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

    function rysujNnfx(f, a::Float64, b::Float64, n::Int, name::String = "plot")
        x = Array{Float64}(n+1)
        x2 = Array{Float64}(20*n+1)
        wartX = Array{Float64}(n+1)
        wartX2 = Array{Float64}(20*n+1)
        nt = Array{Float64}(20*n+1)
        for i = 1:n+1
            x[i] = a+(i-1)*((b-a)/n)
            wartX[i] = f(x[i])
        end
        fx = ilorazyRoznicowe(x, wartX)
        for i = 1:20*n+1
            x2[i] = a+(i-1)*((b-a)/(20*n))
            wartX2[i] = f(x2[i])
            nt[i] = warNewton(x, fx, x2[i])
        end
        plot(x2, [wartX2, nt], label=["Funkcja oryginalna" "Wielomian interpolacyjny"])
        savefig("$name.png")
    end
end