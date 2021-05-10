function nilpotents(n)
    divs, _ = factor_m(n)
    multip = 1
    for x in divs
        multip *= x
    end
    return multip:multip:(n-1)
end