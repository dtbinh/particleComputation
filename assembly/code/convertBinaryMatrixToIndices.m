function [x,y] = convertBinaryMatrixToIndices(m)
if nargs<1
m = [1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
1 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1;
1 1 0 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 1;
1 1 0 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 1;
1 1 0 1 1 0 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 1;
1 1 0 1 1 0 1 1 0 1 1 1 1 1 1 1 0 1 1 0 1 1;
1 1 0 1 1 0 1 1 0 1 1 1 1 1 1 1 0 1 1 0 1 1;
1 1 0 1 1 0 1 1 0 1 1 0 0 0 1 1 0 1 1 0 1 1;
1 1 0 1 1 0 1 1 0 1 1 0 1 0 1 1 0 1 1 0 1 1;
1 1 0 1 1 0 1 1 0 1 1 0 1 0 1 1 0 1 1 0 1 1;
1 1 0 1 1 0 1 1 0 1 1 1 1 0 1 1 0 1 1 0 1 1;
1 1 0 1 1 0 1 1 0 1 1 1 1 0 1 1 0 1 1 0 1 1;
1 1 0 1 1 0 1 1 0 0 0 0 0 0 1 1 0 1 1 0 1 1;
1 1 0 1 1 0 1 1 1 1 1 1 1 1 1 1 0 1 1 0 1 1;
1 1 0 1 1 0 1 1 1 1 1 1 1 1 1 1 0 1 1 0 1 1;
1 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 1;
1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 1;
1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 1;
1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1;
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
end

[x,y] = find(m==1);