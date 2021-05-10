function sortkey(f::Function, a)
    sortkey(f(a), a)
end