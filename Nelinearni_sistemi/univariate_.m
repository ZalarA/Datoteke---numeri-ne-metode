mpol x;

%seznami z rezultati
polinomi=[];
statusi_putinar=[];
statusi_schmudgen=[];

%stopnja polinomov
n=21;

%stevilo primerov
m=30;

%semialgebraicna mnozica za Putinarja
K_put=[x+2>=0,(x-1)*(x-2)>=0,(x-3)*(x-4)>=0,(x+2)*(x-1)*(x-2)>=0,(x+2)*(x-3)*(x-4)>=0,...
   (x-1)*(x-2)*(x-3)*(x-4)>=0, (x+2)*(x-1)*(x-2)*(x-3)*(x-4)>=0];

%semialgebraicna mnozica za Schmuedgena
K_sch=[x+2>=0,(x-1)*(x-2)>=0,(x-3)*(x-4)>=0,(x+2)*(x-1)*(x-2)>=0,(x+2)*(x-3)*(x-4)>=0,...
   (x-1)*(x-2)*(x-3)*(x-4)>=0, (x+2)*(x-1)*(x-2)*(x-3)*(x-4)>=0];

for i=1:m
    %nakljuèen polinom stopnje n-1 v eni spremenljivki
    b=rand(n,1);
    v=[x].^(0:n-1);
    polinomi(i)=b'*v';
    
    
    N=ceil(n/2)-1;
    k=ceil(n/2);
    objective=[]
    status=0;
    
while status<1 & k<100
    P=msdp(min(f),K,k);
    [status,object]=msol(P);
    objective(k-N)=object;
    k=k+1;
end
plot(1:k-N-1,objective,'b*')