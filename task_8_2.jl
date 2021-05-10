function mergesort_iter!(a)
    k = 1
    while k < length(a)
        for i in 1:2k:length(a)
            if (i + k - 1 < length(a) < i + 2k -1)
                b = merge(a[i:i+k-1], a[i+k : lastindex(a)])
                a[i:lastindex(a)] = b
            elseif ( i + 2k -1 <= length(a))
                b = merge(a[i:i+k-1], a[i+k : i+2k - 1])
                a[i:i+2k-1] = b
            end
        end
        k *= 2
    end

    return a
end

function merge1!(a, b, c)
    d = merge(a,b)
    for i in 1:length(c)
        c[i] = d[i]
    end
    return c
end

function mergesort_iter2!(a)
    k = 1
    b = similar(a)
    while k < length(a)
        for i in 1:2k:length(a)
            if (i + k - 1 < length(a) < i + 2k -1)
                b = merge(a[i:i+k-1], a[i+k : lastindex(a)])
                a[i:lastindex(a)] = b
            elseif ( i + 2k -1 <= length(a))
                b = merge(a[i:i+k-1], a[i+k : i+2k - 1])
                a[i:i+2k-1] = b
            end
        end
        k *= 2
    end

    a = b
    return a
end