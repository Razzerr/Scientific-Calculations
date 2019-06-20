#Coded by: Michał Budnik
using Plots
tempRes = []

function fun(n, c, x0)
    if n == 0
        return Float64(x0)
    end
    result = Float64(Float64(fun(n-1, c, x0)^2) + Float64(c))
    append!(tempRes, result)
    return result
end


testData = [(-2, 1), (-2, 2), (-2, 1.99999999999999), (-1, 1), (-1, -1), (-1, 0.75), (-1, 0.25)]
res = []
for i = 1 : 7
    global tempRes = []
    fun(40, testData[i][1], testData[i][2])
    append!(res, [tempRes])
end
x = 1:40

plot(x, res)
savefig("result.png")