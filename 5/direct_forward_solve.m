function z = forward_solve(LU,b)
  if !issquare(LU) || !ismatrix(LU) || !isvector(b) || size(LU)(1) ~= size(b)(2)
    disp('Invalid input data');
    return
  end

  L = tril(A, -1) + diag(1)

  dim = size(L)(1);
  x = zeros(1, dim);

  x(1) = z(1) / L(1, 1);
  for i = 2:dim
    acc = 0;
    for j = 1:i-1
      acc += x(j) * L(i, j);
    end
    x(i) = (z(i) - acc) / L(i,i);
  end
end
