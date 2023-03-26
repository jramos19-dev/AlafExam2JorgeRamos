
function A = Hydrate(nzA, ir, ic)
% This creates the smallest matrix that
% reduces to the compressed row storage provided
n = max(ic);
m = size(ir,1)-1;
A = zeros(m,n);
cur_idx = 1;
for i = 2:m+1
next_idx = ir(i);
for j = cur_idx:next_idx-1
A(i-1, ic(j)) = nzA(j);
end
cur_idx = next_idx;
end
end