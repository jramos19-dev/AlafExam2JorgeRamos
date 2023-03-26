function [ b ] = Place_F_in_b( N, F )
b = zeros( N*N, 1 );
% ii indexes the rhs vector
ii = 1;
for i=2:N+1
for j=2:N+1
b( ii ) = F( i,j );
ii = ii+1;
end
end
h = 1/(N+1);
b = h^2 * b;
end

