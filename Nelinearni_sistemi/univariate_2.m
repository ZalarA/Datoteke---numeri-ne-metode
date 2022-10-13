mpol x;
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