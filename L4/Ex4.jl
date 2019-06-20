#Made by Michał Budnik
using Plots
gr()
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