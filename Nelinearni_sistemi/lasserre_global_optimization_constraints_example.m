%Finding a global mimimum of the function 
%-(x1-2)^2-(x1-x2)^2-(x2-4)^2
%with constraints 
%1-(x1-2)^2>=0, 1-(x1-x2)^2>=0, 1-(x2-4)^2>=0
%using Lasserre relaxation technique

clear all
mpol x1 x2
f=-12*x1-7*x2+x2^2;
pause
K=[0<=x1, x1<=2, 0<=x2, x2<=3, -2*x1^4+2-x2>=0, -2*x1^4+2-x2<=0]
pause
P=msdp(min(f),K,2)
pause
[status,object]=msol(P)
pause
M=double(mmat(meas))
pause
rank(M)
pause
[U1,D,V1]=svd(M(1:3,1:3))
pause
U2=U1*sqrt(D);
V=U2(:,1)
pause
U=rref(V')'
pause
N1=U([2],:)
N2=U([3],:)
pause
lambda1=rand(1)
lambda2=rand(1)
N=lambda1*N1+lambda2*N2
pause
[Q,T]=schur(N)
pause
for i=1
   [Q(:,i)'*N1*Q(:,i),Q(:,i)'*N2*Q(:,i)]
end

%P=msdp(min(f),K,3)
%[status,object]=msol(P)

%P=msdp(min(f),K,4)
%[status,object]=msol(P)

%P=msdp(min(f),K,5)
%[status,object]=msol(P)

%P=msdp(min(f),K,6)
%[status,object]=msol(P)

%P=msdp(min(f),K,10)
%[status,object]=msol(P)