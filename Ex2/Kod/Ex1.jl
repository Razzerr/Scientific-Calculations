#Coded by: Michał Budnik

x = [2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
n = 5

function a()
    SUM_32 = 0
    SUM_64 = 0
    for i = 1:n
       SUM_32 += Float32(x[i]) * Float32(y[i])
       SUM_64 += Float64(x[i]) * Float64(y[i])
    end
    print("Method A, Float32: $SUM_32\n")
    print("Method A, Float64: $SUM_64\n\n")
end

function b()
    SUM_32 = 0
    SUM_64 = 0
    for i = 1:n
       SUM_32 += Float32(x[n+1-i]) * Float32(y[n+1-i]) 
       SUM_64 += Float64(x[n+1-i]) * Float64(y[n+1-i])
    end
    print("Method B, Float32: $SUM_32\n")
    print("Method B, Float64: $SUM_64\n\n")
end

function c()
    results_32 = []
    results_64 = []
    for i = 1:n
        push!(results_32, Float32(x[i])*Float32(y[i]))
        push!(results_64, Float64(x[i])*Float64(y[i]))
    end
    sort!(results_32)
    sort!(results_64)
    SUM_NEG_32 = 0
    SUM_POS_32 = 0
    SUM_NEG_64 = 0
    SUM_POS_64 = 0
    counter = 1
    while results_32[counter] < 0
        SUM_NEG_32 += results_32[counter]
        counter += 1
    end
    counter = n
    while results_32[counter] > 0
        SUM_POS_32 += results_32[counter]
        counter -= 1
    end
    counter = 1
    while results_64[counter] < 0
        SUM_NEG_64 += results_64[counter]
        counter += 1
    end
    counter = n
    while results_64[counter] > 0
        SUM_POS_64 += results_64[counter]
        counter -= 1
    end
    print("Method C, Float32: $(SUM_NEG_32 + SUM_POS_32)\n")
    print("Method C, Float64: $(SUM_NEG_64 + SUM_POS_64)\n\n")
end

function d()
    results_32 = []
    results_64 = []
    for i = 1:n
        push!(results_32, Float32(x[i])*Float32(y[i]))
        push!(results_64, Float64(x[i])*Float64(y[i]))
    end
    sort!(results_32)
    sort!(results_64)
    SUM_NEG_32 = 0
    SUM_POS_32 = 0
    SUM_NEG_64 = 0
    SUM_POS_64 = 0
    middle_32 = 1
    middle_64 = 1
    while results_32[middle_32]<0
        middle_32 +=1
    end
    while results_64[middle_64]<0
        middle_64 +=1
    end
    counter = middle_32-1
    while counter > 0
        SUM_NEG_32 += results_32[counter]
        counter -= 1
    end
    counter = middle_32
    while counter <=n
        SUM_POS_32 += results_32[counter]
        counter += 1
    end
    counter = middle_64-1
    while counter > 0
        SUM_NEG_64 += results_64[counter]
        counter -= 1
    end
    counter = middle_64
    while counter <=n
        SUM_POS_64 += results_64[counter]
        counter += 1
    end
    print("Method D, Float32: $(SUM_NEG_32 + SUM_POS_32)\n")
    print("Method D, Float64: $(SUM_NEG_64 + SUM_POS_64)\n")
end

a()
b()
c()
d()