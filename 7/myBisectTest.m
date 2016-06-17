f = @(x) cos(2*x)^2 - x^2;
[x,e,v] = mybisect(f, 0.75, 0)
figure(1, 'visible', 'off');
plot(e)
xlabel('k')
ylabel('|x_k - x_{k-1}|')
saveas(1, 'PA7.1.fig')

%Die Konvergenzgeschwindigkeit entspricht den Erwartungen, da der Fehler mit steigender Iterationszahl exponentiell abnimmt.
