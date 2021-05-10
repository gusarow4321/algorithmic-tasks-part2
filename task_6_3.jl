function particalsort!(A, b)
    l = 1
    r = length(A)
    while l < r
        while A[r] > b 
            r -= 1
        end

        while A[l] <= b
            l += 1 
        end
        if r > l
            A[l], A[r] = A[r], A[l]
        end
    end
end