function linsolve(A, b)
    x = similar(b)
    for k in lastindex(b):-1:firstindex(b)
        x[k] = (b[k] - sum(A[k, k+1:lastindex(A, 2)].*x[k+1:lastindex(x)]))/A[k,k]
    end

    return x
end