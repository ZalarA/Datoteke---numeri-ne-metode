%iskanje globalnega minimuma polinoma 
%f(x(1),x(2))=x(1)^2*x(2)^2*(x(1)^2+x(2)^2-1)
%s pomo�jo Lasserreje relaksakcije. Na tem primeru 
%ne dobimo prave re�itve.

%Globalni minimumi so 4: x(1)=\pm sqrt(3)/3, x(2)=\pm sqrt(3)/3,
%kar se da videti z ra�unanjem grad(f)=0.

%�e pa f premaknemo za epsilon*(x(1)^(10)+x(2)^(10)) z epsilon=0.001,
%dobimo dobre pribli�ke za globalne minimume.

clear all
mpol x 2

f=x(1)^2*x(2)^2*(x(1)^2+x(2)^2-1)

P=msdp(min(f))
[status,object]=msol(P)

pause

epsilon=10^(-3)
f=x(1)^2*x(2)^2*(x(1)^2+x(2)^2-1)+epsilon*(x(1)^(8)+x(2)^(8))

P=msdp(min(f))
[status,object]=msol(P)
