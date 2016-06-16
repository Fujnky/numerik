U = [1 2 3; 0 4 5; 0 0 6];
z = [1 -1 6];

direct_backward_solve(U, z)

L = [1 0 0; 2 3 0; 4 5 6];
b = [5 6 7];

direct_forward_solve(L, b)

if Vandermonde(b) == vander(b)
  disp('Results are equal')
end
