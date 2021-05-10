using Plots

function newton(z, root, ε,nmaxiter) 
    n=length(root)
    for k in 1:nmaxiter  
        z -= (z - 1/z^(n-1))/n
        root_index = findfirst(r->abs(r-z) <= ε, root)  
        if !isnothing(root_index)
            return root_index
        end
    end
    return nothing
end

function visualisation(D, colors; markersize, backend::Function)
    backend()
    p=plot()
    for i in 1:length(colors)
        plot!(p, real(D[i]), imag(D[i]),
            seriestype = :scatter,
            markersize = markersize,
            markercolor = colors[i])
    end
    plot!(p; ratio = :equal, legend = false)
end

function visualisation(D, colors; markersize, backend::Function)
    backend()
    p=plot()
    for i in 1:length(colors)
        plot!(p, real(D[i]), imag(D[i]),
            seriestype = :scatter,
            markersize = markersize,
            markercolor = colors[i])
    end
    plot!(p; ratio = :equal, legend = false)
end

function kelliproblem(; colors = [:red,:green,:blue],
               nmaxiter = 40, 
               ε = 0.5, 
               numpoints = 10_000_000, 
               squaresize = 500, 
               markersize = 0.01,  
               backend::Function = pyplot
            )
    n = length(colors)
    root = [exp(im*2π*k/n) for k in 0:n-1]
    D = []
    for i in 1:n
        push!(D, [])
    end
    for i in 1:numpoints
        z = complex(rand() -0.5,rand()- 0.5) * squaresize
        m = newton(z, root, ε, nmaxiter)
        if m != nothing
            push!(D[m], z)
        end
    end
    visualisation(D, colors; markersize =  markersize, backend = backend)
end