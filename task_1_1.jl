function reverse!(V::Vector{Int})
    size_V = size(V, 1)
    for i in 1:div(size_V, 2)
        V[i], V[size_V - i + 1] = V[size_V - i + 1], V[i]
    end
    return V
end

function reverse!(M::Array{Int,2}, dim::Int)
    for i in 1:dim
        M[i,:] = reverse!(M[i,:])
    end
    return M
end

function main()
    v = Vector(1:4)
    println(reverse!(v))

    m = [[1, 4, 7] [2, 5, 8] [3, 6, 9]]
    println(reverse!(m, 2))
end