function [v] = myQuadraturSum1D(f,w,p,a,b,N)
  h = (b-a)/N;
  %scale points and weights
  w *= h;
  p *= h;
  v = 0;

  for i = 1:N
    %calculate intervals
    a_ = a + (i-1) * h;
    b_ = a + i * h;
    %add up
    v += sum(w .* f(p .+ a_));
end
