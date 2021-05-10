function sort(A::Matrix) 
    X=deepcopy(A) 
    for i in 1:size(A, 2) 
        for k in 1:size(A, 1) 
            for j in 1:(size(A, 1)-1) 
                if(X[j, i]>X[j+1, i]) 
                    X[j, i],X[j+1, i]=X[j+1, i],X[j, i] 
                end 
            end 
        end 
    end 
    return X 
end 
    
function sort!(X::Matrix) 
    for i in 1:size(X, 2) 
        for k in 1:size(X, 1) 
            for j in 1:(size(X, 1)-1) 
                if(X[j, i]>X[j+1, i]) 
                    X[j, i],X[j+1, i]=X[j+1, i],X[j, i] 
                end 
            end 
        end 
    end 
    return X 
end 
    
function main() 
    B = [[7, 4, 1] [8, 5, 2] [9, 6, 3]] 
    println(sort(B)) 
end