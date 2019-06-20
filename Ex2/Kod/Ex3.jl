#Coded by: Michał Budnik
include("hilb.jl")
include("matcond.jl")

function Hilbert(n)
    A = hilb(n)
    x = ones(n)
    b = A*x

    gaussElimination = Array{Float64, 1}(A \ b)
    inverse = Array{Float64, 1}(inv(A) * b)
    gaussError = norm(x - gaussElimination) / norm(x)
    inverseError = norm(x - inverse) / norm(x)
    print("\nFor n = ", n, ":\nRank = ", rank(A), ", cond = ", cond(A), ", Gauss error: ", gaussError, ", Inverse error: ", inverseError)
end


function solve_random(n, c)
    A = matcond(n, c)
    while det(A) == 0
        A = matcond(n, c)
    end

    x = ones(n)
    b = A*x

    gaussElimination = Array{Float64, 1}(A \ b)
    inverse = Array{Float64, 1}(inv(A) * b)
    gaussError = norm(x - gaussElimination) / norm(x)
    inverseError = norm(x - inverse) / norm(x)
    print("\n++Rank = ", rank(A), ", cond = ", cond(A), ", Gauss error: ", gaussError, ", Inverse error: ", inverseError)
end

print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n
++++++++++++++++++++++++ Hilbert's matrix +++++++++++++++++++++++++++\n
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n")
for i = 1 : 20
    Hilbert(i)
end

print("\n\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n
++++++++++++++++++++++++ Random matrix ++++++++++++++++++++++++++++++\n
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
n = [5, 10, 20]
c = [1, 10, 10^3, 10^7, 10^12, 10^16]
for i = 1 : size(n)[1]
    print("\nFor n = ", n[i], ": ")
    for j = 1 : size(c)[1]
        print("\n+For c = ", c[j], ": ")
        solve_random(n[i], Float64(c[j]))
    end
end
