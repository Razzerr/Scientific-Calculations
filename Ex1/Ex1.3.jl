#Coded by: Michał Budnik

x=1
while x!=2
    x += 2.0^-52
    print("$(bits(Float64(x)))\n")
end