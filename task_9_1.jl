function cosx(x, n)
    an = 1
    sn = 0
    m = 2
    sqrX = x^2
    for i in 0:(n+1)
        sn += an
        an = - an * sqrX /(m-1)/m
        m += 2
    end
    
    return sn
end