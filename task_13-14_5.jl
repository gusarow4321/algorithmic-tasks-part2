function next_decomp(n,inp,res)
    if len(inp)==0
        return res
    else
        iinp=collect(0)
        rres=res
        for z in inp
            sz = sum(z)
            if sz==n
                zz = sorted(z)
                if not zz in rres
                    rres.insert!(zz)
                end
            else
                k=n-sz
                for i in range(1,k+1)
                    iinp.insert!([i]+z)
                end
        end
        return next_decomp(n,iinp,rres)
    end    
end  

function gen_sum(n)
    res=collect(0)
    for a in next_decomp(n,[[i] for i in range(1,n+1)],[])
        res.insert!(list(reversed(a)))
    end
    return sorted(res,reverse=True)
end