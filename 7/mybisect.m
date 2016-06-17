function [x,e,v] = mybisect(f, x00, x0)
  a = x00;
  b = x0;
  err = 1;
  x = x0;
  v = f(x0);
  while err >= 1e-12
    xn = 0.5 * (a + b);
    err = abs(xn-x(end));
    x = [x xn];
    e = [e err];
    v = [v f(xn)]
    if f(a) * f(xn) < 0
      b = xn;
    elseif f(xn) * f(b) < 0
      a = xn;
    elseif f(xn) == 0
      a = xn;
      b = xn;
  end
end
