fprintf('Available functions: (0) cos(x), (1) sin(x), (2) 3x^4-7, (3) e^x, (4) 1/x\n');
n = input('Which function to evaluate: ');
switch n
    case 0
        f = @(x) cos(x);
        df = @(x) -1*sin(x);
        d2f = @(x) -1*cos(x);
        d3f = @(x) sin(x);
        ti = 'cos(x)';
    case 1
        f = @(x) sin(x);
        df = @(x) cos(x);
        d2f = @(x) -1*sin(x);
        d3f = @(x) -1*cos(x);
        ti = 'sin(x)';
    case 2
        f = @(x) .5*x^4 + 7;
        df = @(x) 2*x^3;
        d2f = @(x) 6*x^2;
        d3f = @(x) 12*x;
        ti = 'x^4/2+7';
    case 3
        f = @(x) exp(x);
        df = f;
        d2f = f;
        d3f = f;
        ti = 'e^x';
    case 4
        f = @(x) 1/x;
        df = @(x) -1/x^2;
        d2f = @(x) 2/x^3;
        d3f = @(x) -6/x^4;
        ti = '1/x';
    otherwise
        return
end

x = input('Value of x: ');
centered = input('(0) Forward or (1) Centered difference: ');
exact = input('(0) Use exact optimal error or (1) estimate: ');

% how many different values of h to try
num_points = 150;

% bounds for x
min_y = -4;
max_y = 3;

% bounds for h
min_x = -17;
max_x = 2;

% calculate the optimal value of h wrt total error
opt = findh(f, d2f, d3f, x, centered, exact);
opt_val = abs(approx(f, x, opt, centered) - df(x));
fprintf('Optimal h: %d Optimal val: %d\n', opt, opt_val)

% initialize vectors
h_vals = logspace(min_x, max_x, num_points);
errors = zeros(1, num_points);
estimates = zeros(1, num_points);

% calculate actual and estimated error at values of h
for i = 1:num_points
    errors(i) = abs(approx(f, x, h_vals(i), centered) - df(x));
    estimates(i) = errorest(f, d2f, d3f, x, h_vals(i), centered);
end

% plot results
figure
loglog(h_vals, estimates, 'g-', ... 
    h_vals, errors, 'b.', ... 
    opt, opt_val, 'rs');
%axis([10^min_x, 10^max_x, 10^min_y, 10^max_y])
xlabel('h');
ylabel('E(h)');
title(ti);
grid on
hold off