function z = forward_solve(LU,b)
  if !issquare(LU) || !ismatrix(LU) || !isvector(b) || size(LU)(1) ~= size(b)(2)
    disp('Invalid input data');
    return
  end

  dim = size(LU)(1);
  L = tril(LU, -1) + eye(dim);
  z = zeros(1, dim);

  z(1) = b(1) / L(1, 1);
  for i = 2:dim
    acc = 0;
    for j = 1:i-1
      acc += z(j) * L(i, j);
    end
    z(i) = (b(i) - acc) / L(i,i);
  end
end
