format longEng
%Racunamo eno od resitev, tj. x2, kvadratne enacbe x^2+2ax+b=0 na dva nacina:
%Nestabilna oblika:  x2=-a+sqrt(a^2-b)
%Stabilna oblika:    x2=-b/(a+sqrt(a^2-b))

disp(sprintf('\nRešujemo kvadratno enaèbo x^2+2ax+b=0.\n'))
pause

a=10000; b=-1; disp(sprintf('Izberemo a= %5d, b= %1d.\n', a,b))
pause

disp(sprintf('Najprej uporabimo nestabilno formulo x2=-a+sqrt(a^2-b).\n'))
pause

x2=-a+sqrt(a^2-b);
disp(sprintf('Dobimo x2=-a+sqrt(a^2+b)=%1.15e  \n', x2))
pause

disp(sprintf('Preverimo, ali je rezultat res 0.\n'))
disp(sprintf('x2^2+2*a*x2+b= %1.15e \n', x2^2+2*a*x2+b))
pause

disp(sprintf('Racunamo še prek stabilne formule x2=-b/(A+sqrt(A^2-b)).\n'))
x2=vpa(-b/(A+sqrt(A^2-b)),52);
disp(sprintf('Dobimo x2=b/(a+sqrt(a^2+b))= %1.15e \n', x2))
pause

disp(sprintf('Preverimo, ali je rezultat res 0.\n'))
disp(sprintf('x2^2+2*a*x2+b= %1.15e \n', x2^2+2*a*x2+b))