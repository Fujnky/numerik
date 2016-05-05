function y = runge(x)
  y = 1 ./ (1+25*x.^2);
end

%evaluate Newton polynomial
function y = evalNewton(x, x_i, c)
  %N_0 = 1
  y = c(1);
  for i=2:length(x_i)
    k = c(i);
    for j=1:(i-1)
      k .*= (x-x_i(j));
    end
    y += k;
  end
end

for n=[7 12 17]
  i = 0:n;
  x_equidist = -1+2*i./n;
  x_cheby = cos((2*i+1)*pi./(2*n+2));
  c_equidist = myNewtonInterpol(x_equidist, runge(x_equidist));
  c_cheby = myNewtonInterpol(x_cheby, runge(x_cheby));
  x_e = -1:0.001:1;
  figure(n, 'visible', 'off');
  plot(x_e, runge(x_e), 'g-',
    x_e, evalNewton(x_e, x_equidist, c_equidist), 'r-',
    x_e, evalNewton(x_e, x_cheby, c_cheby), 'b-',
    x_equidist, runge(x_equidist), 'r*',
    x_cheby, runge(x_cheby), 'b*');
  saveas(n, ["PA2-1-N" num2str(n) ".fig"]);
  clf()

  m = 100;
  j = 0:m;
  delta = -1 + 2*j./m;
  disp(["Maximum error for n=" num2str(n)])
  equidistant = max(abs(runge(delta) - evalNewton(delta, x_equidist, c_equidist)))
  chebyshev = max(abs(runge(delta) - evalNewton(delta, x_cheby, c_cheby)))

end
