%Iskanje minimum polinoma (x^2+1)^2+(y^2+1)^2+(x+y+1)^2
%s kombinacijo gradientnega spusta za dober za�etni pribli�ek
%in Broydenove metode, ki je posplo�itev sekantne metode na ve� spremenljik
%in se izogne ra�unanju Jacobijeve matrike.

f=inline('[(x(1)^2+1)^2+(x(2)^2+1)^2+(x(1)+x(2)+1)^2]')
gradf=inline(strcat(...
            ' [ 2*(x(1)^2+1)*2*x(1)+2*(x(1)+x(2)+1);',...
            ' 2*(x(2)^2+1)*2*x(2)+2*(x(1)+x(2)+1)]'));
x=gradient_descent(f,gradf,[1;1])
y=broyden(gradf,eye(2),x,eps)
format long
f(y)
