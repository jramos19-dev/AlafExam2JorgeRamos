% The [ 0,1 ] x [ 0,1 ] square is partitioned into N x N interior grid
% points
N = 50;
% Distance between grid points
h = 1/(N+1);
% Parameters for the load function
% f( chi, psi ) = ( alpha + beta ) * pi^2 * sin( alpha * pi * chi ) *
% sin( beta * pi * psi )
alpha = 2;
beta = 3;
% Compute the x-values at each point i,j, including the boundary
x = h * [ 0:N+1 ]; % Notice this creates a row vector
% Compute the y-values at each point i,j, including the boundary
y = h * [ 0:N+1 ]; % Notice this creates a row vector
% Create an array that captures the load at each point i,j
for i=1:N+2
for j=1:N+2
F( i,j ) = ...
( alpha^2 + beta^2 ) * pi^2 * sin( alpha * pi * x( i ) ) * ...
sin( beta * pi * y( j ) );
end
end;
% Create the archtypical matrix A that corresponds to the Poisson equation
% on the unit square
A = Create_Poisson_problem_A( N );
% Create the right-hand side so we can view this as the problem A x = b
% We do it this way because it is just easier to create the 2D mesh of load
% values, and then transfer them.
b = Place_F_in_b( N, F );
% Choose an initial guess to be used for all algorithms
rng default
x0 = rand(size(b));
% Solve A x = b using Matlab's built-in solver (which probably does an LU
% with partial pivoting and probably does not take advantage of zeroes in
% the matrix. But who knows...
% soln = A \ b;
% reset solution
soln = 0;
% Solve A x = b using Method of Steepest Descent
disp( 'Method of Steepest Descent (no preconditioning)' );
[ soln, niters ]= Method_of_Steepest_Descent( A, b, x0 );
niters
% To make it easy to display the result, we place the solution vector into
% U, which captures the 2D grid of displacements.
U = Place_x_in_U( N, soln );
% Show the result
mesh( x, y, U );
% Set the x-, y-, and z-axes limits
axis( [ 0 1 0 1 -1.5 1.5 ]);
input( 'RETURN to continue' );
% Solve A x = b using Method of Steepest Descent
disp( 'Preconditioned Method of Steepest Descent (incomplete Cholesky)' );
% reset solution
soln = 0;
[ soln, niters ] = Method_of_Steepest_Descent_ichol( A, b, x0 );
niters
U = Place_x_in_U( N, soln );
% Show the result
mesh( x, y, U );
% Set the x-, y-, and z-axes limits
axis( [ 0 1 0 1 -1.5 1.5 ]);
input( 'RETURN to continue' );
% Solve A x = b using CG
disp( 'CG (no preconditioning)' );
% reset solution
soln = 0;
[ soln, niters ] = CG( A, b, x0 );
niters
U = Place_x_in_U( N, soln );
% Show the result
mesh( x, y, U );
% Set the x-, y-, and z-axes limits
axis( [ 0 1 0 1 -1.5 1.5 ]);
input( 'RETURN to continue' );
% Solve A x = b using Preconditioned CG
disp( 'CG (incomplete Cholesky)' );
% reset solution
soln = 0;
[ soln, niters ] = PCG( A, b, x0 );
niters
U = Place_x_in_U( N, soln );
% Show the result
mesh( x, y, U );

% Set the x-, y-, and z-axes limits
axis( [ 0 1 0 1 -1.5 1.5 ]);


