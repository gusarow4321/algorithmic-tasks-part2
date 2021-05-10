function C(n, k)
    if k == 0 || k == n
        return 1
    else
        return C(n - 1, k) + C(n-1, k-1)
    end
end

function get_basic_Bernstein(n, x)
    coeffs = []
    for k in 1:n
        push!(coeffs, C(n, k) * x^k * (1 - x)^(n - k))
    end
    return coeffs
end

function Bernstein_polynom(f::Function, n, x)
    coeffs = get_basic_Bernstein(n,x)
    result = 0
    for k in 1:n
        result += f(k/n) * coeffs[k]
    end
    return result
end

function Bernstein_polynom(f, n, x)
    coeffs = get_basic_Bernstein(n, x)
    result = 0
    for k in 1:n
        result += coeffs[k]*f[k]
    end
    return result
end

function test_Bernstein()
    test1 = []
    test2 = []
    for i in 0:100
        k = i / 100
        push!(test1, 2^k)
        push!(test2, Bernstein_polynom(x->2^x, 30, k))
    end
    plot(test1)
    plot(test2)
end