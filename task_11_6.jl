function podsvetca(a,b)

    for j in 1:length(b)
            if i<= length(a)-2
                    Line(xdata=(b[j], b[j+1,]), ydata=(b[j+3], b[j+2,]))
    end

    for i in a
            in_me(b,a[i])
end

function in_me(self, point)
    result = False
    n = len(self.corners)
    p1x = int(self.corners[0].x)
    p1y = int(self.corners[0].y)
    for i in range(n+1)
        p2x = int(self.corners[i % n].x)
        p2y = int(self.corners[i % n].y)
        if point.y > min(p1y,p2y)
            if point.x <= max(p1x,p2x)
                if p1y != p2y
                    xinters = (point.y-p1y)*(p2x-p1x)/(p2y-p1y)+p1x
                    return xinters
                end
                if p1x == p2x || point.x <= xinters
                    result = - result
                end
            end
    end
        p1x,p1y = p2x,p2y
    return result
end