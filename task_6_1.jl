function merge(A,B)
    C = promote_type(eltype(A), eltype(B))[]
    i, j = 1, 1
    n, m = 1, 1
    while i <= length(A)  || j <= length(B) 
        while i <= length(A) && ( A[i] <= B[m] || j > length(B))
            push!(C, A[i])
            i += 1
            n += 1
        end
        if n > length(A)
            n -= 1
        end
        while j <= length(B) && (B[j] <= A[n] || i > length(A))
            push!(C,B[j])
            j += 1
            m += 1
        end
        if m > length(B)
            m -= 1
        end
    end

    return C
end

function merge1(A,B)
    C = Vector{promote_type(eltype(A), eltype(B))}(undef, length(A) + length(B))
    k = 1
    i, j = 1, 1
    n, m = 1, 1
    while i <= length(A)  || j <= length(B) 
        while i <= length(A) && ( A[i] <= B[m] || j > length(B))
            C[k] = A[i]
            i += 1
            n += 1
            k += 1
        end
        if n > length(A)
            n -= 1
        end
        while j <= length(B) && (B[j] <= A[n] || i > length(A))
            C[k] = B[j]
            j += 1
            m += 1
            k += 1
        end
        if m > length(B)
            m -= 1
        end
    end

    return C
end

function merge!(A, B, C)
    i, j, k = 1, 1, 1
    D = promote_type(eltype(A), eltype(B),eltype(C))[]
    while i <= length(A) || j <= length(B) || k <= length(C)
        min_El = typemax(promote_type(eltype(A), eltype(B),eltype(C)))
        if i <= length(A) && A[i] <= min_El
            min_El = A[i]
            determinator = 1
        end
        if j <= length(B) && B[j] <= min_El
            min_El = B[j]
            determinator = 2
        end
        if k <= length(C) && C[k] <= min_El
            min_El = C[k]
            determinator = 3
        end
        push!(D, min_El)
        if determinator == 1
            i += 1
        elseif  determinator == 2
            j += 1
        else
            k += 1
        end
    end
    C = D
    return C
end