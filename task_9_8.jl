function issingular_convert!(A)
    rows, columns = size(A)
    for k in 1:columns
        imax = findMaxAbsInColumn(A, k)
        column_to_zeroes!(A, k, imax)
        if A[k, k] == 0 
            return false
        end
    end
    return true
end

function det(A)
    isntDegenerate = issingular_convert!(A)
    if isntDegenerate == false
        return eltype(A)(0)
    else
        det = eltype(A)(1)
        for i in 1:lastindex(A, 1)
            det *= A[i, i]
        end
        return det
    end
end