%Iskanje minimum polinoma (x^2+1)^2+(y^2+1)^2+(x+y+1)^2
%s kombinacijo gradientnega spusta za dober zaèetni približek
%in Broydenove metode, ki je posplošitev sekantne metode na veè spremenljik
%in se izogne raèunanju Jacobijeve matrike.

f=inline('[(x(1)^2+1)^2+(x(2)^2+1)^2+(x(1)+x(2)+1)^2]')
gradf=inline(strcat(...
            ' [ 2*(x(1)^2+1)*2*x(1)+2*(x(1)+x(2)+1);',...
            ' 2*(x(2)^2+1)*2*x(2)+2*(x(1)+x(2)+1)]'));
x=gradient_descent(f,gradf,[1;1])
y=broyden(gradf,eye(2),x,eps)
format long
f(y)
