disp(sprintf('\nJacobijeva iteracija za testni primer:\n'))
%
disp(sprintf(['12x-3y+z=10,\n'...
    '-x+9y+2z=10,\n',...
    'x-y+10z=10.\n']))
pause

A=[12, -3, 1; -1, 9, 2; 1, -1, 10];
%D=diag(A);
%L=-tril(A,-1);
%U=-triu(A,1);
b=[10;10;10];

disp(sprintf('Zacetni priblizek:'))
x0=[1/2;1/2;1/2]
pause

jacobi(A,x0,b)

%disp(sprintf('Supremum norma matrike R je %1.3f.',norm(inv(diag(D))*(L+U),inf)))
     
