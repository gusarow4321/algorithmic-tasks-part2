function ord(a, p)
    orders = factor(p - 1)
    for x in orders
        if pow(a, x)%p == 1
            return x
        end
    end
end