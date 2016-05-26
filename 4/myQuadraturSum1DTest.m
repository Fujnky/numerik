runge = @(x) 1 ./ (1+25*x.^2);
runge_integrated = @(x) 1/5 * atan(5*x);
true_solution = runge_integrated(1) - runge_integrated(-1);
n = 1:100;

err_trapez = arrayfun(@(x) true_solution - myQuadraturSum1D(runge, [0.5 0.5], [0 1], -1, 1, x), n);
err_simpson = arrayfun(@(x) true_solution - myQuadraturSum1D(runge, [1/6 4/6 1/6], [0 0.5 1], -1, 1, x), n);
err_milne = arrayfun(@(x) true_solution - myQuadraturSum1D(runge, [7/90 32/90 12/90 32/90 7/90], [0 0.25 0.5 0.75 1], -1, 1, x), n);

figure(1, 'visible', 'off');
semilogy(n, abs(err_trapez), n, abs(err_simpson), n, abs(err_milne));
legend('Trapezregel', 'Simpsonregel', 'Milneregel');
xlabel('n');
ylabel('quadrature error');
saveas(1, 'myQuadraturSum1DPlot.fig');
