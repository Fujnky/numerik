function [c]=myNewtonInterpol(x,f)
  n = length(x);
  %initialize output
  c = zeros(1,n);
  %a_0 = y_0
  c(1) = f(1);

  for i = 2:n
    %reduction
    f = reduce(x, f);
    %take first reduced value as this iteration's result
    c(i) = f(1);
  end
end

%Compute reduced set of values for next iteration
function [reduced] = reduce(x, f_i)
  l = length(f_i);
  dif = length(x) - l + 1;
  reduced = zeros(1,l-1);

  for i=1:l-1
    reduced(i) = (f_i(i+1) - f_i(i)) / (x(i+dif)-x(i));
  end
end
