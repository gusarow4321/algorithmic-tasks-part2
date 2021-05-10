function rang(A; isStep = false)::Int
    if isStep == false
        convert!(A)
    end
    rows, _ = size(A)
    for i in 1:rows
        if A[i, i] == 0
            return i-1
        end
    end
    return rows
end