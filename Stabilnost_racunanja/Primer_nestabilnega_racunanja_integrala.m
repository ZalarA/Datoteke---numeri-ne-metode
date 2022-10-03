disp(sprintf(['\nRacunamo integral funkcije x^n*exp(-x) na intervalu od 0 do 1.\n',...
'\nOznacimo ta integral z I_n.\n',...
'Z uporabo pravila per partes dobimo rekurzijo I_n=-1(exp(1)+n*I_{n-1}.\n',...
'Ce izracunamo se I_0=1-1/e, lahko I_n rekurzivno racunamo.\n']))
pause


%Spodaj je postopek na oba nacina, pri cemer tocen rezultat izracunamo z 
%vgrajeno metodo za numericno integracijo integral. 

disp('          n  |    naprej         |     toèno         |   razlika')
I=1-1/exp(1);
f=@(x,n)x.^n*exp(-x);
J=integral(@(x)f(x,0),0,1,'ArrayValued',true);
n=0;
disp(sprintf('%12d | %5.15f | %10.15f | %5.15f', n,I,J(1),J(1)-J(1)))
for n=1:20
  I=n*I-1/exp(1);
  J=integral(@(x)f(x,n),0,1,'ArrayValued',true);
  value=J(1);
  disp(sprintf('%12d | %5.15f | %10.15f | %5.15f',n,I,value,I-value))
end
pause

disp(sprintf(['\nVendar ta postopek ni numericno stabilen, saj v formuli napako mnozimo z n.\n',...
'Trik, ki deluje, je izraziti I_{n-1} iz formule, I_{n-1}=(I_n+1/exp(1))*1/n\n',...
'in racunati vzvratno. Pri tem lahko vzamemo velik n in I_n nakljucno izberemo.\n',...
'Na vsakem koraku racunanja napako pomnozimo z 1/n, tako da po dovolj korakih\n',...
'zacetno napako povsem iznicimo.']))
pause

disp(sprintf('\nZacetni pribllizek 0:\n'))
pause
disp('          n  |    nazaj          |     toèno         |   razlika')

I=0;
n=30;
J=integral(@(x)f(x,n),0,1,'ArrayValued',true);
disp(sprintf('%12d | %5.15f | %10.15f | %5.15f', n,I,J(1),I-J(1)))


for n=29:-1:0
  I=(I+1/exp(1))/(n+1);
  J=integral(@(x)f(x,n),0,1,'ArrayValued',true);
  value=J(1);
  disp(sprintf('%12d | %5.15f | %10.15f | %5.15f',n,I,value,I-value))
end
pause

disp(sprintf('\nZacetni pribllizek 10000:\n'))
pause
disp('          n  |    nazaj          |     toèno         |   razlika')
I=10^4;
n=30;
J=integral(@(x)f(x,n),0,1,'ArrayValued',true);
disp(sprintf('%12d | %5.15f | %10.15f | %5.15f', n,I,J(1),I-J(1)))
for n=29:-1:0
  I=(I+1/exp(1))/(n+1);
  J=integral(@(x)f(x,n),0,1,'ArrayValued',true);
  value=J(1);
  disp(sprintf('%12d | %5.15f | %10.15f | %5.15f',n,I,value,I-value))
end