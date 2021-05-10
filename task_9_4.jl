function ln(x)
    sn = 0
    k = 0
    bk =  -(1 - x)
    while abs(bk) > eps() 
        ak  = bk / (k+1)
        k += 1
        sn += ak
        bk *= (1-x)
    end

    return sn
end

function row2(x)
    sn = 1
    ak = -0.5 * x
    k = 1
    while abs(ak) > eps()
        sn += ak
        ak *= (x - k)*x
        k += 1
        ak = ak / k
    end

    return sn
end

function row3(x)
    uk = -x*x
    vk = 1
    wk = 1
    sn = 0
    k = 1
    while abs(uk*(vk + wk)) > eps()
        sn += uk*(vk + wk)
        uk = -uk * x * x
        vk = vk /(k + 1)
        wk = wk /2k/(2k + 1)
        k += 1
    end

    return sn
end

function test_rows()
    println(ln(0.5), " ", log(0.5))
    println(row2(0.5), " ", 1/sqrt(1.5))
    println(row3(0.5), " ", 0.5*sin(0.5) - exp(-0.25))
end