%iskanje globalnega minimuma polinoma 
%f(x(1),x(2))=x(1)^2*x(2)^2*(x(1)^2+x(2)^2-1)
%s pomoèjo Lasserreje relaksakcije. Na tem primeru 
%ne dobimo prave rešitve.

%Globalni minimumi so 4: x(1)=\pm sqrt(3)/3, x(2)=\pm sqrt(3)/3,
%kar se da videti z raèunanjem grad(f)=0.

%Èe pa f premaknemo za epsilon*(x(1)^(10)+x(2)^(10)) z epsilon=0.001,
%dobimo dobre približke za globalne minimume.

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
