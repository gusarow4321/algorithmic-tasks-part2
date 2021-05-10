function bubblesort(A::Array{Int})
    X=deepcopy(A)
    for i in 1:size(A, 1)
        for j in 1:size(A, 1)-i
            if(X[j]>X[j+1])
                X[j],X[j+1]=X[j+1],X[j]
            end
        end
    end
    return X
end

function bubblesort!(A::Array{Int})
    for i in 1:size(A, 1)
        for j in 1:size(A, 1)-i
            if(A[j]>A[j+1])
                A[j],A[j+1]=A[j+1],A[j]
            end
        end
    end
    return A
end

function bubblesortperm(A::Array{Int})
    indexes=collect(1:size(A, 1))
    for i in 1:size(A, 1)
        for j in 1:size(A, 1)-i
            if(A[j]>A[j+1])
                indexes[j],indexes[j+1]=indexes[j+1],indexes[j]
            end
        end
    end
    return indexes
end

function bubblesortperm!(A::Array{Int}, B::Array{Int})
    if(size(A, 1)==size(B, 1))
        B=collect(1:size(A, 1))
        for i in 1:size(A, 1)
            for j in 1:size(A, 1)-i
                if(A[j]>A[j+1])
                    B[j],B[j+1]=B[j+1],B[j]
                end
            end
        end
        return B
    end
end

function main()
    A = [5, 4, 3]
    bubblesortperm(A)
end