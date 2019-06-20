#Coded by: Michał Budnik

function machepsCheck()
    fl = 1
    fl_prev = 1

    while 1 + Float16(fl) > 1
        fl_prev = fl
        fl /= Float16(2) 
    end
    print("Float16: macheps is $(fl_prev)\n")
    print("Float16: eps() is $(eps(Float16))\n\n")

    while 1 + Float32(fl) > 1
        fl_prev = fl
        fl /= Float32(2) 
    end
    print("Float32: macheps is $(fl_prev)\n")
    print("Float32: eps() is $(eps(Float32))\n\n")

    while 1 + Float64(fl) > 1
        fl_prev = fl
        fl /= Float64(2) 
    end
    print("Float64: macheps is $(fl_prev)\n")
    print("Float64: eps() is $(eps(Float64))\n\n")
end

function etaCheck()
    fl = 1
    fl_prev = 1

    while Float16(fl) > 0
        fl_prev = fl
        fl /= Float16(2) 
    end
    print("Float16: eta is $(fl_prev)\n")
    print("Float16: nextfloat() is $(nextfloat(Float16(0.0)))\n\n")
    fl = 1
    fl_prev = 1
    while Float32(fl) > 0
        fl_prev = fl
        fl /= Float32(2) 
    end
    print("Float32: eta is $(fl_prev)\n")
    print("Float32: nextfloat() is $(nextfloat(Float32(0.0)))\n\n")
    fl = 1
    fl_prev = 1
    while Float64(fl) > 0
        fl_prev = fl
        fl /= Float64(2) 
    end
    print("Float64: eta is $(fl_prev)\n")
    print("Float64: nextfloat() is $(nextfloat(Float64(0.0)))\n\n")
end

function maxCheck()
    fl = 1
    fl_prev = 1

    while !isinf(Float16(fl))
        fl_prev = fl
        fl += Float16(fl_prev)
    end
    fl = fl_prev
    fl_add = fl_prev/2
    while fl+fl_add != fl
        fl_prev = fl
        fl = Float16(fl+fl_add)
        fl_add = Float16(fl_add/2)
    end
    print("Float16: max is $(fl_prev)\n")
    print("Float16: realmax is $(realmax(Float16))\n\n")

    fl = 1
    fl_prev = 1

    while !isinf(Float32(fl))
        fl_prev = fl
        fl += Float32(fl_prev)
    end
    fl = fl_prev
    fl_add = fl_prev/2
    while fl+fl_add != fl
        fl_prev = fl
        fl = Float32(fl+fl_add)
        fl_add = Float32(fl_add/2)
    end

    print("Float32: max is $(fl_prev)\n")
    print("Float32: realmax is $(realmax(Float32))\n\n")

    fl = 1
    fl_prev = 1

    while !isinf(Float64(fl))
        fl_prev = fl
        fl += Float64(fl_prev)
    end
    fl = fl_prev
    fl_add = fl_prev/2
    while fl+fl_add != fl
        fl_prev = fl
        fl = Float64(fl+fl_add)
        fl_add = Float64(fl_add/2)
    end
    print("Float64: max is $(fl_prev)\n")
    print("Float64: realmax is $(realmax(Float64))\n\n")
end

machepsCheck()
etaCheck()
maxCheck()
