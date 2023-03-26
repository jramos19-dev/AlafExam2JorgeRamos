function [nzA, ir, ic] = create_poisson_matrix(N)
% create slightly oversized, empty arrays
nzA = zeros(5*N^2,1);
ic = zeros(5*N^2,1);
ir = zeros(N^2+1,1);
% begin count of nonzero values
nz_counter = 1;
% we iterate over all the rows
for i = 1:N^2
% update the array containing
% the number of nonzeroes prior to
% the current row
ir(i) = nz_counter;
% compute the nonzeros in the row (n),
% the number of nonzeros in the row (r),
% and the column indices of those values (c)
[n, r, c] = compute_row_update(i, N);
% update the array containing all
% nonzero entries.
nzA(nz_counter:nz_counter + r - 1) = n;
% update the array containing the
% column indices of nonzero values
ic(nz_counter:nz_counter + r - 1) = c;
% increase the count of nonzero values
nz_counter = nz_counter + r;
end
% finish count of nonzero values
ir(end,1) = nz_counter;
% truncate unused entries
nzA = nzA(1:ir(end,1)-1);
ic = ic(1:ir(end,1)-1);
end