function x = backward_solve(LU,z)
  if !issquare(LU) || !ismatrix(LU) || !isvector(z) || size(LU)(1) ~= size(z)(2)
    disp('Invalid input data');
    return
  end

  dim = size(LU)(1);
  x = zeros(1, dim);

  x(dim) = z(dim) / LU(dim, dim);
  for i = dim-1:-1:1
    acc = 0;
    for j = dim:-1:i+1
      acc += x(j) * LU(i, j);
    end
    x(i) = (z(i) - acc) / LU(i,i);
  end
end
