function x = secant(X, F, tol, maxit)
%x = secant([x0,x1,...,xn], F, tol, maxit) poisce resitev x 
%enacbe F(x) = 0 s sekantno metodo. x0, ..., xn so zacetni priblizki, 
%F funkcija, tol natancnost in maxit najvecje stevilo iteracij

%shranimo velikost in kolicino zacetnih priblizkov; m = n+1
[n, m] = size(X);

%pripravimo prvi bazni vektor R^(n+1)
e1 = [1;zeros(n,1)];

%Pri vsakem koraku iteracije izracunamo nov priblizek x = X*z, kjer je 
%z resitev sistema Z*z=e1 za matriko Z=[1, ..., 1; F(x0), ..., F(xn)].
%(Ta x je ravno resitev enacbe A*x+b=0, kjer je x -> A*x+b afina aproksimacija 
%za F glede na zacetne priblizke x0, ..., xn.)

%Pred zacetkom iteracije pripravimo Z. 
%(Znotraj iteracije bomo popravljali le zadnji stoplec Z.)
for j = 1:m
	Z(:,j) = [1; feval(F, X(:,j))];
end

for k = 1:maxit
	x = X*(Z\e1);		%nov priblizek
	Fx = feval(F, x);	
	if(norm(Fx) < tol)
		break;
	end
	X = [X(:,2:m),x];	%nov priblizek dodamo v X, zavrzemo prvega
	Z = [Z(:,2:m),[1; Fx]];	%popravimo zadnji stolpec Z, zavrzemo prvega
end
 