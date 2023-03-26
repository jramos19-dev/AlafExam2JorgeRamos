function [x, niters] = CG(A, b, x0)

% Initialize x to x0
x = x0;

% Initialize r to b 
r = b;

% Initialize p to r
p = r;

% Initialize k-1 variables
r_old = r;
p_old = p;

% Initialize niters to 0
niters = 0;

% Perform iterations until r is close to 0
while norm(r) > eps
    if niters == 0
        % Update p
        p = r;
    else
        % Calculate the coefficient gamma
        gamma = (r'*r) / (r_old'*r_old);
        
        % Update p
        p = r + gamma*p_old;
    end
    
    % Calculate the step size alpha
    alpha = (r'*r) / (p'*A*p);

    % Store r and p for the next iteration
    r_old = r;
    p_old = p;

    % Update x and r
    x = x + alpha*p;
    r = r - alpha*A*p;   

    % Increment the iteration count
    niters = niters + 1;
end
end

