disp(sprintf(['\nRacunamo vrsto 1/(1*2)+1/(2*3)+...+1/(n*(n+1)) na tri nacine.\n',...
    '\nTocen rezultat je n/(n+1) (npr. indukcija)\n',...
    '\nNumericno lahko sestevamo od leve proti desni, ali od desne proti levi.\n']))
pause
disp(sprintf('Racunanje od desne proti levi je bistveno stabilnejse.\n'))
pause

disp('          n  |           naprej            |            nazaj            |     to�no')
naprej=0;
nazaj=0;
for n=[10,100,1000,10000]
  for i=1:n
    naprej=naprej+1/(i*(i+1));
  end
  for i=n:-1:1
    nazaj=nazaj+1/(i*(i+1));
  end
  disp(sprintf('%12d | %5.25f | %5.25f | %5.25f', n,naprej,nazaj,n/(n+1)))
naprej=0;
nazaj=0;
end
