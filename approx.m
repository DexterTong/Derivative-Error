% Approximate the derivative of f at x by the centered difference quotient
function y = approx(f, x, h, centered)
    % f = function to find derivative of
    % x = point to find derivative at
    % h = increment
    if centered
        y = (f(x+h)-f(x-h))/(2*h);
    else
        y = (f(x+h)-f(x))/h;
    end
    