function solveSLAE(A)
    rangA = rang(A, isStep = true)
    rows, columns = size(A)
    if rangA == rows
        return zeros(rows)
    end
    k = 0
    for i in rows:-1:1
        if A[i, i] != 0
            k = i
            break
        end
    end

    A[k, k:columns] = A[k, k:columns]/A[k,k]
    for i in k-1:-1:firstindex(b)
        for j in columns:-1:i+1
            if isapproxzero(A[i, j])
                A[i,j] = 0
                continue
            end
            A[i, j:columns] = A[i, j:columns] - A[j, j:columns]/A[j,j]* A[i,j]
        end
        A[i, i:columns] = A[i, i:columns] / A[i,i]
    end

    c = []
    for i in 1:columns-k
        push!(c, "c"*"$i")
    end
    FRS = []
    for i in k:-1:1
        newline = "x$i = "
        for j in k+1:columns
            b = A[i,j]
            if b > 0
                newline = newline * " - $b *" *c[j-k]
            elseif  b < 0
                b *= -1
                newline = newline * " + $b * "*c[j-k]
            end
        end
        if newline == "x$i = "
            newline = newline * "0"
        end
        push!(FRS, newline)
    end

    for i in k+1:columns
        pushfirst!(FRS, "x$i = " * c[i - k])
    end

    return FRS
end