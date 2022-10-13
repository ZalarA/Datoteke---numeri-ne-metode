%iskanje globalnega minimuma polinoma 
%f(x)=x^6+x^5+2*x^3-3*x+5
%s pomoèjo Lasserreje relaksakcije.

clear all
mpol x

n=20;
b=rand(n,1);
v=[x].^(0:n-1);
f=b'*v'
pause
K=[1-x>=0,1+x>=0]
pause
P=msdp(min(f),K)
[status,object]=msol(P)

pause

b=rand(6,1);
v=[x].^(0:5);
pause
f=b'*v'
pause
K=[1-x>=0,1+x>=0]
pause
P=msdp(min(f),K)
[status,object]=msol(P)

n=21;
b=rand(n,1);
v=[x].^(0:n-1);
f=b'*v'
pause
K=[x+2>=0,(x-1)*(x-2)>=0,(x-3)*(x-4)>=0,(x+2)*(x-1)*(x-2)>=0,(x+2)*(x-3)*(x-4)>=0,...
   (x-1)*(x-2)*(x-3)*(x-4)>=0, (x+2)*(x-1)*(x-2)*(x-3)*(x-4)>=0]
pause
P=msdp(min(f),K)
[status,object]=msol(P)

pause

n=21;
b=rand(n,1);
v=[x].^(0:n-1);
f=b'*v'
pause
K=[(x+2)^3>=0,(1+x)^3*x>=0,(x-1)*(x-2)>=0,(x-3)^3*(x-4)>=0,5-x>=0]
pause
P=msdp(min(f),K)
[status,object]=msol(P)
pause
P=msdp(min(f),K,11)
[status,object]=msol(P)
pause
P=msdp(min(f),K,12)
[status,object]=msol(P)
pause
P=msdp(min(f),K,13)
[status,object]=msol(P)
