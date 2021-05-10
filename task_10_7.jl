using  Polynomials

function find_deriative(P::Polynomial)::Polynomial
    coeffs = P.coeffs
    if length(coeffs) <= 1
        return Polynomial([0])
    end
    newcoeffs = Vector{Number}(undef, 0)
    for i in 2:length(coeffs)
        push!(newcoeffs, (coeffs[i] * (i-1)))
    end
    return Polynomial(newcoeffs)
end

function count_polynom(x::Number, p::Polynomial)::Number
    coeffs = copy(p.coeffs)
    reverse!(coeffs)
    result = coeffs[1]
    for i in 2:length(coeffs)
        result *= x
        result += coeffs[i]
    end
    return result
end

function newton_pol(polynom_coeff::AbstractVector, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)
    x1 = x
    x2 = x + 2 * ε_x
    p = Polynomial(polynom_coeff)
    p1 = find_deriative(copy(p))
    f = count_polynom(x1, p)
    for i in 1:nmaxiter
        if (abs(x1 - x2) < ε_x || f < ε_y) && i > 1
            return x1
        end
        x2 = x1
        f = count_polynom(x1, p)
        f1 = count_polynom(x1, p1)
        x1 = x1 - f/f1
    end
    if abs(x1 - x2) < ε_x || f < ε_y
        return x1
    end
    return nothing
end