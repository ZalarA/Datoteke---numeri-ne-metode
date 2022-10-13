fprintf(['Z Newtonovo metodo rešujemo sistem\n\n'...
    '   3*x(1) - cos(x(1)*x(2)) - 3*0.6=0,\n'...
    '   x(1)^2 - 81*(x(2)+0.1)^2 + sin(x(3)) + 1.1=0,\n'...
    '   exp(-x(1)*x(2)) + 20*x(3) + 9.1=0.\n\n'])
    
pause
fprintf('Rešujemo sistem z zaèetnim približkom [1;1;1]:\n\n')

pause
newtonAD([1;1;1]);
%{
pause
fprintf('\n\n Rešujemo sistem z nakljuènim zaèetnim približkom rand(3,1):\n\n')

pause
newtonAD(rand(3,1));

pause
fprintf('\n\n Rešujemo sistem z zaèetnim približkom [-1;-7;-3]:\n\n')

pause
newtonAD([-1;-7;-3]);}