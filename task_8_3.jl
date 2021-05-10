using Random
using BenchmarkTools
function comprassion()
    array = []
    for i in 1:999999
        push!(array, rand())
    end
    array2 = array
    @btime sort!(array)
    @btime mergesort!(array2)
end