A = [1,2,5,7,3,4,8,5,3,2,6,8,4,2,5,8,6,6]
function findallmax(A)
    max = A[firstindex(A)]
    max_num = []
    for i in (firstindex(A):lastindex(A))
        if A[i] > max
            max = A[i]
            max_num = []
        end
        if A[i] == max
            append!(max_num, i)
        end
    end
    return max_num
end