for n = 10:5:25
  i = 1:n;
  x = (n-i)./n;
  b = [ones(1, ceil(n/2)-1),2*ones(1, floor(n/2)+1)];
  V = vander(x);
  LU = LU_decompose(V);
  z = forward_solve(LU, b);
  y = backward_solve(LU, z);
  norm(V*y.'-b.')
end
