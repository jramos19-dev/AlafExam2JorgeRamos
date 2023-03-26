function [ U ] = Place_x_in_U( N, x )
U = zeros( N+2, N+2 );
% ii indexes the rhs vector
ii = 1;
for i=2:N+1
for j=2:N+1
U( i,j ) = x( ii );
ii = ii+1;
end
end
end
