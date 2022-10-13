disp(sprintf('\nSOR iteracija za testni primer:\n'))
%
disp(sprintf(['12x-3y+z=10,\n'...
    '-x+9y+2z=10,\n',...
    'x-y+10z=10.\n']))
pause

A=[12, -3, 1; -1, 9, 2; 1, -1, 10];
%D=diag(A)
%L=-tril(A,-1)
%U=-triu(A,1)
b=[10;10;10]

disp(sprintf('Zacetni priblizek:'))
x0=[1/2;1/2;1/2]
pause

disp(sprintf('Relaksacijski faktor:'))
w=1.25
pause

sor(A,x0,b,w)
pause
%R=inv(diag(D)-w*L)*((1-w)*diag(D)+w*U);

%disp(sprintf('Supremum norma matrike R je %1.3f.',norm(R,inf)))

disp(sprintf('Odvisnost konvergence od w:'))
pause

W=linspace(0.01,2-0.01,100);
K=linspace(0.01,2-0.01,100);

S=size(W);
t=S(2);

for i=1:t
  [y,korak]=sor(A,x0,b,W(i));
  K(i)=korak;
end

plot(W,K)
    
     
