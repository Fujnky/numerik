function V = Vandermonde(v)
  if !isvector(v)
    disp('Invalid input data');
    return
  end
  
  n = size(v)(2);
  V = ones(n, 1);
  for i = 1:n-1
    V = [v.^i.' V];
  end
end
