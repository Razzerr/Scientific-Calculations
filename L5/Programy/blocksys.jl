#Credits: Michał Budnik
module blocksys  
    export solveGauss, matrixToLU, pivotedMatrixToLU, solveLU, solvePivotedLU, readMatrix, readVector

function solveGauss(matrixPath::String, findB::Bool = false, vectorPath::String = "", pivoted::Bool = false, saveResult::Bool = false, resultPath::String = "out.txt")
    Matrix = readMatrix(matrixPath)
    A = Matrix[1]
    n = Matrix[2]
    l = Matrix[3]
    b = Array{Float64}(n)
    x = Array{Float64}(n)

    if !findB
        b = readVector(vectorPath)
    else
        b = genVector(A, n)
    end

    if pivoted
        x = pivotedGauss(A, b, n, l)
    else
        x = gauss(A, b, n, l)
    end

    if saveResult
        if findB
            saveVector(resultPath, x, n, true, calcError(x, n))
        else
            saveVector(resultPath, x, n)
        end
    end
end

function solveLU(matrixPath::String, findB::Bool = false, vectorPath::String = "", pivoted::Bool = false, saveResult::Bool = false, resultPath::String = "out.txt")
    Matrix = readMatrix(matrixPath)
    A = Matrix[1]
    n = Matrix[2]
    l = Matrix[3]
    b = Array{Float64}(n)
    x = Array{Float64}(n)

    if !findB
        b = readVector(vectorPath)
    else
        b = genVector(A, n)
    end

    if pivoted
        p = pivotedMatrixToLU(A, n, l)
        x = solvePivotedLU(A, b, n, l, p)
    else
        matrixToLU(A, n, l)
        x = solveNormalLU(A, b, n, l)
    end

    if saveResult
        if findB
            saveVector(resultPath, x, n, true, calcError(x, n))
        else
            saveVector(resultPath, x, n)
        end
    end
end

function genVector(A::SparseMatrixCSC{Float64, Int64}, n::Int64)
    b = Array{Float64}(n)
    vals = nonzeros(A)
    rows = rowvals(A)
    for i in 1:n
        for j in nzrange(A, i)
            b[rows[j]] += vals[j]
        end
    end
    return b
end

function gauss(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64)
    for k in 1 : Int64(n/l)
        rowStart = (k - 1)*l + 1
        rowEnd = min(rowStart + 2*l - 1, n)

        rowAEnd = rowStart + l - 1

        colEnd = min(k*l + l, n)
        for i in rowStart : rowAEnd
            for j in i + 1 : rowEnd
                if eps(Float64) > abs(A[i, i])
                    error("Diagonal coefficient equals 0!")
                    return
                end
                subtractCoef = A[j, i] / A[i, i]
                A[j, i] = 0
                for m in i + 1 : colEnd
                    # print(k, ", ", i, ", ", j, ", ", m, "\n")
                    A[j, m] = A[j, m] - subtractCoef * A[i, m]
                end
                b[j] = b[j] - subtractCoef * b[i]
            end
        end
    end

    x = Array{Float64}(n)
    for k in Int64(n/l):-1:1
        colEnd = min(k*l + l, n)

        rowStart = (k - 1)*l + 1
        rowAEnd = rowStart + l - 1

        for i in rowAEnd :-1: rowStart
            sum = 0
            for j in i+1 : colEnd
                sum += A[i, j] * x[j]
            end
            x[i] = (b[i] - sum) / A[i, i]
        end
    end
    return x
end

function pivotedGauss(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64)
    p = collect(1:n)

    for k in 1 : Int64(n/l)
        rowStart = (k - 1)*l + 1
        rowEnd = min(rowStart + 2*l - 1, n)

        rowAEnd = rowStart + l - 1

        colEnd = min(k*l + l, n)

        for i in rowStart : rowAEnd
            for j in i + 1 : rowEnd

                maxRow = i
                max = abs(A[p[i], i])
                for x in i : rowEnd
                    if (abs(A[p[x], i]) > max)
                        maxRow = x;
                        max = abs(A[p[x], i])
                    end
                end
                p[i], p[maxRow] = p[maxRow], p[i]

                if eps(Float64) > max
                    error("Diagonal coefficient equals 0!")
                    return
                end
                subtractCoef = A[p[j], i] / A[p[i], i]
                A[p[j], i] = 0
                for m in i + 1 : colEnd
                    # print(k, ", ", i, ", ", j, ", ", m, "\n")
                    A[p[j], m] = A[p[j], m] - subtractCoef * A[p[i], m]
                end
                b[p[j]] = b[p[j]] - subtractCoef * b[p[i]]
            end
        end
    end

    x = Array{Float64}(n)
    for k in Int64(n/l):-1:1
        colEnd = min(k*l + l, n)

        rowStart = (k - 1)*l + 1
        rowAEnd = rowStart + l - 1

        for i in rowAEnd :-1: rowStart
            sum = 0
            for j in i+1 : colEnd
                sum += A[p[i], j] * x[j]
            end
            x[i] = (b[p[i]] - sum) / A[p[i], i]
        end
    end

    return x
end

function matrixToLU(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
    for k in 1 : Int64(n/l)
        rowStart = (k - 1)*l + 1
        rowEnd = min(rowStart + 2*l - 1, n)

        rowAEnd = rowStart + l - 1

        colEnd = min(k*l + l, n)
        for i in rowStart : rowAEnd
            for j in i + 1 : rowEnd
                if eps(Float64) > abs(A[i, i])
                    error("Diagonal coefficient equals 0!")
                    return
                end
                subtractCoef = A[j, i] / A[i, i]
                A[j, i] = subtractCoef
                for m in i + 1 : colEnd
                    # print(k, ", ", i, ", ", j, ", ", m, "\n")
                    A[j, m] = A[j, m] - subtractCoef * A[i, m]
                end
            end
        end
    end
end

function pivotedMatrixToLU(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
    p = collect(1:n)

    for k in 1 : Int64(n/l)
        rowStart = (k - 1)*l + 1
        rowEnd = min(rowStart + 2*l - 1, n)

        rowAEnd = rowStart + l - 1

        colEnd = min(k*l + l, n)

        for i in rowStart : rowAEnd
            for j in i + 1 : rowEnd

                maxRow = i
                max = abs(A[p[i], i])
                for x in i : rowEnd
                    if (abs(A[p[x], i]) > max)
                        maxRow = x;
                        max = abs(A[p[x], i])
                    end
                end
                p[i], p[maxRow] = p[maxRow], p[i]

                if eps(Float64) > max
                    error("Diagonal coefficient equals 0!")
                    return
                end
                subtractCoef = A[p[j], i] / A[p[i], i]
                A[p[j], i] = subtractCoef
                for m in i + 1 : colEnd
                    # print(k, ", ", i, ", ", j, ", ", m, "\n")
                    A[p[j], m] = A[p[j], m] - subtractCoef * A[p[i], m]
                end
                # b[p[j]] = b[p[j]] - subtractCoef * b[p[i]]
            end
        end
    end
    return p
end

function solveNormalLU(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64)
    #Wyliczanie Ly = b
    for k in 1 : Int64(n/l)
        rowStart = (k - 1)*l + 1
        rowEnd = min(rowStart + 2*l - 1, n)
        rowAEnd = rowStart + l - 1

        for i in rowStart : rowAEnd
            for j in i + 1 : rowEnd
                b[j] = b[j] - A[j,i]*b[i]
            end
        end
    end

    #Wyliczanie Ux = y
    x = Array{Float64}(n)
    for k in Int64(n/l):-1:1
        colEnd = min(k*l + l, n)

        rowStart = (k - 1)*l + 1
        rowEnd = rowStart + l - 1

        for i in rowEnd :-1: rowStart
            sum = 0
            for j in i+1 : colEnd
                sum += A[i, j] * x[j]
            end
            x[i] = (b[i] - sum) / A[i, i]
        end
    end
    return x
end

function solvePivotedLU(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64, p::Array{Int64})
    #Wyliczanie Ly = b
    for k in 1 : Int64(n/l)
        rowStart = (k - 1)*l + 1
        rowEnd = min(rowStart + 2*l - 1, n)
        rowAEnd = rowStart + l - 1

        for i in rowStart : rowAEnd
            for j in i + 1 : rowEnd
                b[p[j]] = b[p[j]] - A[p[j], i] * b[p[i]]
            end
        end
    end

    #Wyliczanie Ux = y
    x = Array{Float64}(n)
    for k in Int64(n/l):-1:1
        colEnd = min(k*l + l, n)

        rowStart = (k - 1)*l + 1
        rowEnd = rowStart + l - 1

        for i in rowEnd :-1: rowStart
            sum = 0
            for j in i+1 : colEnd
                sum += A[p[i], j] * x[j]
            end
            x[i] = (b[p[i]] - sum) / A[p[i], i]
        end
    end
    return x
end

function readMatrix(path::String)
    open(path) do x
        line = split(readline(x))
        n = parse(Int64, line[1])
        l = parse(Int64, line[2])
        size = n*l + n*2 - 2*l # v * sizeof(Ak) + v * sizeof(Bk|Ck) * 2

        cols = Array{Int64}(size)
        rows = Array{Int64}(size)
        vals = Array{Float64}(size)
        index = 0

        while !(eof(x))
            index += 1
            line = split(readline(x))
            rows[index] = parse(Int64, line[1])
            cols[index] = parse(Int64, line[2])
            vals[index] = parse(Float64, line[3])
        end

        m = sparse(rows, cols, vals)
        return (m, n, l)
    end
end

function readVector(path::String)
    open(path) do x
        n = parse(Int64, readline(x))
        vector = Array{Float64}(n)
        index = 0

        while !(eof(x))
            index += 1
            vector[index] = parse(Float64, readline(x))
        end

        return vector
    end
end

function calcError(x::Array{Float64}, n::Int64)
    biggest = 0
    for i in 1::Int64   
        if abs(1-x[i]) > biggest
            biggest = abs(1-x[i])
        end
    end
    return Float64(biggest*100)
end

function saveVector(path::String, x::Array{Float64}, n::Int64, erBool::Bool = false, error::Float64 = 0.0)
    open(path, "w") do f
        if erBool
            write(f, string(error))
            write(f, '\n')
        end

        for i in 1:n
            write(f, string(x[i]))
            write(f, '\n')
        end
    end
end

end