function accurate_cosx(x)
    an = 1
    sqrX = x^2
    sn = 0
    m = 2
    while abs(an) > eps()
        sn += an
        an = - an * sqrX /(m-1)/m
        m += 2
    end
    return sn
end