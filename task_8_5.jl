function k_statistics(a, k::Int)
    if length(a) < 2
        return a[1]
    end
    a, i, j = partsort!(a, a[(1+length(a)) ÷ 2])
    if k <= i
        return k_statistics(a[1:i], k)
    elseif i < k < j+1
        return a[k]
    else
        return k_statistics(a[j+1:end], k - j)
    end
end

function median(a)
    if length(a) % 2 == 0
        return k_statistics(a, length(a) ÷ 2)
    else
        return k_statistics(a, (length(a) ÷ 2 + 1))
    end
end