using Plots
function makeCosPlots()
    x = 0:0.01:1.00
    yn2, yn4, yn8, yn16 = [], [], [], []
    for i in x
        push!(yn2, cosx(i, 2))
    end
    for i in x
        push!(yn4, cosx(i, 4))
    end
    for i in x
        push!(yn8, cosx(i, 8))
    end
    for i in x
        push!(yn16, cosx(i, 16))
    end
    p = plot(x, yn2)
    plot!(p, x, yn4)
    plot!(p, x, yn8)
    plot!(p, x, yn16)
    display(p)
end