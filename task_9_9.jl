function inv(A)
    hasInv = issingular_convert!(copy(A))
    if hasInv == false
        return nothing
    end
    rows, columns = size(A)
    E = A^0
    D = Matrix{eltype(A)}(undef, rows, 2columns)
    for i in 1:rows
        D[i, :] = append!(copy(A[i, :]), E[i, :])
    end
    convert!(D)
    for i in 1:rows
        E[i, :] = D[i, rows+1:2rows]
    end

    return E
end