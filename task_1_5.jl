function sortkey(key_values, a)
    indperm=sortperm(key_values)
    return a[indperm]
end