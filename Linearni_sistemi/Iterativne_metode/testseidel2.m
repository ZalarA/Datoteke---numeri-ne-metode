disp(sprintf('\nGauss-Seidlova iteracija za testni primer:\n'))
%
disp(sprintf(['-2x+y=-1,\n'...
    'x-2y+z=0,\n',...
    'y-2z+w=0,\n'...
    'z-2w=-1.\n']))
pause

A = [-2 1 0 0; 1 -2 1 0; 0 1 -2 1; 0 0 1 -2];
%D=diag(A)
%L=-tril(A,-1)
%U=-triu(A,1)
b = [-1; 0; 0; -1]

disp(sprintf('Zacetni priblizek:'))
x0=[eps;eps;eps;eps]
pause

gaussseidel(A,x0,b,eps,100)

%disp(sprintf('Supremum norma matrike R je %1.3f.',norm(inv(diag(D)+L)*U,inf)))
     
