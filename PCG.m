% Inputs: A is an n-by-n matrix, b is an n-by-1 column vector
% Outputs: x is an n-by-1 column vector, niters is the number of iterations
function [x, niters] = PCG(A, b,x0)

% Initialize x to zero
x = x0;

% Initialize r to b
r = b;

% Initialize k to zero
k = 0;

%initialize k-1 
r_old=r;
p_old=r;

% Perform iterations until r is close to zero
while norm(r) > eps

    % Calculate the coefficient gamma
    if k == 0
        p=r;
    else
        gamma = (r'*r) / (r_old'*r_old);
        p=r+gamma*p_old;
    end

    % Calculate the step size alpha
    alpha = (r'*r) / (p'*A*p);

    % Update p_prev
    p_old    = p;
     % Update r
    r_old = r;

    % Update x
    x = x + alpha*p;

    r = r - alpha*A*p;
K=k+1;
end

% Set the output niters to k
niters = k;
end