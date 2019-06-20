#Coded by: Michał Budnik

print("Float16: macheps is $((Float16(3)*((Float16(4)/Float16(3))-Float16(1)))-Float16(1))\n")
print("Float16: eps() is $(eps(Float16))\n\n")

print("Float32: macheps is $((Float32(3)*((Float32(4)/Float32(3))-Float32(1)))-Float32(1))\n")
print("Float32: eps() is $(eps(Float32))\n\n")

print("Float64: macheps is $((Float64(3)*((Float64(4)/Float64(3))-Float64(1)))-Float64(1))\n")
print("Float64: eps() is $(eps(Float64))\n\n")