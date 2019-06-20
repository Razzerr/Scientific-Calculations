#Coded by: Michał Budnik
p0 = 0.01
r = 3

function p(n)
    if n == 0
        return Float32(p0)
    end
    pPrev = Float32(p(n-1))
    return Float32(pPrev+r*pPrev*(1-pPrev))
end

print("\n40 iterations of normal algorithm (Flotat32): ", p(40), "\n")

function p_fl64(n)
    if n == 0
        return Float64(p0)
    end
    pPrev = Float64(p_fl64(n-1))
    return Float64(pPrev+r*pPrev*(1-pPrev))
end

print("\n40 iterations of normal algorithm (Flotat64): ", p_fl64(40), "\n")

step = 0
function p_modified(n)
    if n == 0
        return Float32(p0)
    end
    pPrev = Float32(p_modified(n-1))
    if step == 10
        pPrev = Float32(trunc(pPrev, 3))
    end
    global step = step + 1
    return Float32(pPrev+r*pPrev*(1-pPrev))
end
print("\n40 iterations of changed algorithm: ", p_modified(40), "\n")