function LU = LU_decompose(A)
  if !issquare(A) || !ismatrix(A)
    disp('Invalid input data');
    return
  end

  n = size(A)(1);
  for u = 1:n-1
    for w = u+1:n
      A(w, u) = A(w, u) / A(u, u);
      for v = u+1:n
        A(w, v) = A(w, v) - A(w, u) * A(u, v);
      end
    end
  end
  LU = A;
end
