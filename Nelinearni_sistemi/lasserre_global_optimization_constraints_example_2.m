%Finding a global mimimum of the function 
%-12*x1-7*x2+x2^2
%with constraints 
%-2*x1^4+2-x2=0, 0<=x1<=2, 0<=x2<=3
%using Lasserre relaxation technique

mpol x1 x2

f=-12*x1-7*x2+x2^2
K=[-2*x1^4+2-x2>=0, x1>=0, x1<=2, x2>=0, x2<=5];

P=msdp(min(f),K,2)
[status,object]=msol(P)
pause
M=double(mmat(meas))
double(meas)
pause
[U1,D,V1]=svd(M)
U2=U1*sqrt(D);
V=U2(:,1:2)
U=rref(V',1e-7)'
%{
N1=U([2,4,5],:)
N2=U([3,5,6],:)
%}
N1=U([2,4],:)
N2=U([3,5],:)

lambda1=rand(1)
lambda2=rand(1)
N=lambda1*N1+lambda2*N2
[Q,T]=schur(N)
x=[];
for i=1:2
   x(i,:)=[Q(:,i)'*N1*Q(:,i),Q(:,i)'*N2*Q(:,i)]
end

%{
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
%}
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