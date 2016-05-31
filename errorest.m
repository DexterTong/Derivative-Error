
function y = errorest(f, d2f, d3f, x, h, centered)
    % f = function to find derivative of
    % d2f = f''
    % d3f = f'''
    % x = point to find derivative at
    % h = increment
    ep = 2.2*10^-16;
    if centered
        y = (h^2/6)*abs(d3f(x)) + (ep/h)*abs(f(x));
    else
        y = (h/2)*abs(d2f(x)) + (2*ep/h)*abs(f(x));
    end