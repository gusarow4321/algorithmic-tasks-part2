function maxpartsum(a)
    sum=0
    mins = 0
    answer = 0
    for i in 1:lastindex(a)
        sum= sum+a[i]
        answer = max(answer, sum - mins )
        mins = min(sum, mins)
    end
    return answer
end