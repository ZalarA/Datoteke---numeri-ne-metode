%Finding a global mimimum of the function 
%-(2*x1-1)^2-4*(x1-x2)^2-(2*x2-3)^2
%with constraints 
%1-(2*x1-1)^2>=0, 1-4*(x1-x2)^2>=0, 1-(2*x2-3)^2>=0
%using Lasserre relaxation technique

mpol x1 x2

f=-(2*x1-1)^2-4*(x1-x2)^2-(2*x2-3)^2
K=[1-(2*x1-1)^2>=0, 1-4*(x1-x2)^2>=0, 1-(2*x2-3)^2>=0];

P=msdp(min(f),K)
[status,object]=msol(P)
double(mmat(meas))
rank(double(mmat(meas)))

P=msdp(min(f),K,2)
[status,object]=msol(P)
M=double(mmat(meas))
rank(M)
[U1,D,V1]=svd(M)
U2=U1*sqrt(D);
V=U2(:,1:3)
U=rref(V')'
N1=U([2,4,5],:)
N2=U([3,5,6],:)
lambda1=rand(1)
lambda2=rand(1)
N=lambda1*N1+lambda2*N2
[Q,T]=schur(N)
for i=1:3
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