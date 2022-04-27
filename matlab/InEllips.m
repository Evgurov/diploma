function In = InEllips(x, q, Q)
    if dot(x - q, Q^(-1)*(x - q)) <= 1
        In = true;
    else
        In = false;
    end
end

