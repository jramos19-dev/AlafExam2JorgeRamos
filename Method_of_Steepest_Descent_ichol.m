
function [x, niters] = Method_of_Steepest_Descent_ichol(A, b, x0)
% Solve Ax=b using Method of Steepest Descent with incomplete Cholesky preconditioning

% Initialize variables
x = x0;
r =b-A*x;
L = sparse(ichol(sparse(A)));
niters = 0;

% Loop until convergence
while  norm(r) > eps
    % Apply preconditioner
    p = L' \ (L \ r);

    q= A*p

    % Calculate step size
    alpha = (p'*r) / (p' * q);

    % Update solution and residual
    x = x + alpha*p;
    r = r - alpha*A*p;

    % Increment iteration counter
    niters = niters + 1;
end
end
