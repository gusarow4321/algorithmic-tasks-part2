function bisection(f::Function, a, b; atol = 0.001, rtol = 0.001)
    x = (a+b) / 2
    while (b-a) > atol || (b - a)/x > rtol
        if f(a)*f(x) < 0
            b = x
            x = (a+b)/2
        elseif f(x)*f(b) < 0
            a = x
            x = (a+b)/2
        elseif f(x) == 0
            return x
        end
    end
    return x
end