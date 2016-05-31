function y = findh(f, d2f, d3f, x, centered, exact)
    % f = function to find derivative of
    % d2f = 2nd derivative of f, only used for forward quotient
    % d3f = 3rd derivative of f, only used for centered quotient
    % x = point to find derivative at
    ep = 2.2 * 10^-16;
    if centered
        if exact
            y = nthroot((3*ep*abs(f(x)))/abs(d3f(x)), 3);
        else
            y = abs(nthroot(3*ep, 3) * x);
        end
    else
        if exact
            y = 2*sqrt((ep*abs(f(x)))/abs(d2f(x)));
        else
            y = abs(sqrt(ep) * x);
        end
    end