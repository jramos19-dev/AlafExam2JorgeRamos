function [...
nzA_update, ir_increment, ic_update ...
] = compute_row_update(i, N)
% determine whether we’re at a junction
% between blocks of N rows
R = mod(i, N);
% we adjust the stencil to account
% for the extra zero that appears at
% the junction between blocks
dummy = [-1; -1; 4; -1; -1];
diags_ic = [i-N; i-1; i; i+1; i+N];
if R == 1
dummy = [-1; 4; -1; -1];
diags_ic = [i-N; i; i+1; i+N];
elseif R == 0
dummy = [-1; -1; 4; -1];
diags_ic = [i-N; i-1; i; i+N];
end
% Get nonzero column indices
idx = find(diags_ic>0 & diags_ic<=N^2);
% store the number of new nonzero entries
ir_increment = size(idx,1);
% store new nonzero entries and their col indices
ic_update = diags_ic(idx);
nzA_update = dummy(idx);
end
