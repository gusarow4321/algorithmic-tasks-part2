A = [1,2,5,7,3,4,8,5,3,2,6,8,4,2,5,8,6,6]
function nummax(A)
    max = A[firstindex(A)]
    count = 1
    for i in (firstindex(A):lastindex(A))
        if A[i] > max
            max = A[i]
            count = 0
        end
        if A[i] == max
            count += 1
        end
    end
    return count
end