function x = direct_backward_solve(U,z)
  if !issquare(U) || !ismatrix(U) || !isvector(z) || size(U)(1) ~= size(z)(2)
    disp('Invalid input data');
    return
  end

  dim = size(U)(1);
  x = zeros(1, dim);

  x(dim) = z(dim) / U(dim, dim);
  for i = dim-1:-1:1
    acc = 0;
    for j = dim:-1:i+1
      acc += x(j) * U(i, j);
    end
    x(i) = (z(i) - acc) / U(i,i);
  end
end
