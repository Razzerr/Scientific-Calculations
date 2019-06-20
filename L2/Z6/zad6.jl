using Plots


c = -2.0
x0 = 1.0
x1 = 2.0
x2 = 1.99999999999999

function f(start, step, max)
    temp = Array{Float64}(40)
    temp[1] = start*start + step
    for i = 2:max
        temp[i] = temp[i-1] * temp[i-1] + step
      
    end


    return temp
end
x = 1:40
arr = f(x0,c,40)
arr2 = f(x1,c,40)
arr3 = f(x2,c,40)
plot(x,[arr,arr2,arr3])
savefig("const_minus_two.png")

c = -1.0
x0 = 1.0
x1 = -1.0


x = 1:40
arr = f(x0,c,40)
arr2 = f(x1,c,40)

plot(x,[arr,arr2])
savefig("const_minus_one_first.png")

x2 = 0.75
x3 = 0.25
arr3 = f(x2,c,40)
arr4 = f(x3,c,40)

plot(x,[arr3,arr4])
savefig("const_minus_one_second.png")
