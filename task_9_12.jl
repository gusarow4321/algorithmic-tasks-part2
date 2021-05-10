function solveNSLAE(D)
    basic_numbers = []
    rows, columns = size(D)

    if D[rows, columns] != 0
        for i in (columns-1):-1:1
            if D[rows, i] != 0
                break
            end

            if i == 1
                return nothing
            end
        end
    end

    for i in 1:rows
        for j in (columns - 1):-1:1
            if j == 1
                push!(basic_numbers, 1)
                break
            end
            if D[i, j] == 0
                push!(basic_numbers, j-1)
                break
            end
        end
    end

    D[rows, :] = D[rows, :]/D[rows,basic_numbers[1]]
    rows -= 1
    for k in 2:lastindex(basic_numbers)
        for i in 1:k
            D[rows, i:columns] = D[rows, i:columns] - D[rows, i] * D[rows + i, i:columns]
        end
        D[rows, :] = D[rows, :] / D[rows, basic_numbers[k]]
        rows -= 1
    end
    x = D[:, columns]
    return x
end