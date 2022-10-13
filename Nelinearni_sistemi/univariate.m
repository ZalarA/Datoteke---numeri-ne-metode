clear all
mpol x
n=21;
b=rand(n,1);
v=[x].^(0:n-1);
f=b'*v'
K=[x+2>=0,(1+x)*x>=0,(x-1)*(x-2)>=0,(x-3)*(x-4)>=0]
P=msdp(min(f),K,100)
[status,object]=msol(P)
