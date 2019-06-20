#Coded by: Michał Budnik

x = 1

while Float64(x*Float64(1/(x))) == 1
    x += Float64(2.0^-52)
end

print("$(Float64(x))\n")
print("$(bits(Float64(x)))\n")