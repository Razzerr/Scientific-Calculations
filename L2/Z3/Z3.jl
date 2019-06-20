"""
Created by Mateusz Jachniak

"""

include("hilb.jl")
include("matcond.jl")



function solve_hilbert(n)
    A = hilb(n)
    x = ones(n)
    b = zeros(n)
    b = A*x

    gauss = Array{Float64, 1}(A \ b)
    inverse = Array{Float64, 1}(inv(A) * b)

    gaussError = norm(x - gauss) / norm(x)
    inverseError = norm(x - inverse) / norm(x)
	println(n, " & ", rank(A), " & ", cond(A), " & ", gaussError, " & ", inverseError, " \\\\")
end


function solve_random(n, c)
    A = matcond(n, c)
    while det(A) == 0
        A = matcond(n, c)
    end
    x = ones(n)
    b = zeros(n)
    b = A * x

    gauss = A \ b
    inverse = inv(A) * b

    gaussError = norm(x - gauss) / norm(x)
    inverseError = norm(x - inverse) / norm(x)
	println(n, " & ", rank(A), " & ", c, " & ", gaussError, " & ", inverseError, " \\\\")
end

println("HILB(n)")
for i = 1 : 20
    solve_hilbert(i)
end

println("MATCOND(n, c)")
n = [5, 10, 20]
c = [1, 10, 10^3, 10^7, 10^12, 10^16]
for i = 1 : size(n)[1]
    for j = 1 : size(c)[1]
        solve_random(n[i], Float64(c[j]))
    end
end
