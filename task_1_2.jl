function user_copy(X::Array{Int})
    x=Array{Int}(1:(size(X, 1)*size(X, 2)))
    for i in 1:(size(X, 1)*size(X, 2))
        x[i]=X[i];
    end
    return reshape(x, (size(X, 2), size(X, 1)))
end

function main()
    A = Vector{Int}(3:7)
    B = [[1, 4, 7] [2, 5, 8] [3, 6, 9]]
    println(user_copy(A))
    println(user_copy(B))
end