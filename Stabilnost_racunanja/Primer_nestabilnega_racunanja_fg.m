disp(sprintf(['Raèunamo vrednost funkcije x*(koren(x+1)-koren(x)) na dva\n',... 
        'analitièno enakovredna naèina:\n']))

disp(sprintf('f(x)=x*(koren(x+1)-koren(x))\n'))
disp(sprintf('g(x)=x/(koren(x+1)+koren(x))\n'))
pause

f=inline('x*(sqrt(x+1)-sqrt(x))');
g=inline('x/(sqrt(x+1)+sqrt(x))');

disp(sprintf(['Izpisujemo vrednosti f(x), g(x) in razlike f(x)-g(x) za x=10^i,\n'... 
        'kjer i teèe od 1 do 20.\n']))

disp(sprintf('Oblika f(x) je nestabilna formula, g(x) pa stabilna.\n'))
pause

disp(' i v x=10^i  |      nestabilna for.    |           stabilna for.   |           razlika')
for i=1:20;
  x=10^i;
  A=f(x);
  B=g(x);
  disp(sprintf('%12d | %23.14f | %25.14f | %25.14f ', i,A,B,A-B))
end
