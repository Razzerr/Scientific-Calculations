i = Float64(1)
while i < 2
    i += Float64(2.0^(-52))
    if Float64(i)*Float64((1/i)) != 1
        break
    end
end
println(i)
println(bits(i))