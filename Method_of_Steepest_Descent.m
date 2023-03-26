function [x, niters] = Method_of_Steepest_Descent(A, b, x0)
 
% Initialize x to 0
x = x0;

% Initialize r to b 
r = b - A*x;

% Initialize iterations to 0
niters = 0;

% Perform iterations until r is close to 0
while  norm(r) > eps
    % Calculate the step direction p
    p = r;
    % q to replace the Ap 
    q=A*p;

    % Calculate the step size alpha
    alpha = (p'*r) / (p'*q);
    
    % Update x and r
    x = x + alpha*p;
    r = r-alpha*q;
    
    % Increment the iteration count
    niters = niters + 1;
end
end