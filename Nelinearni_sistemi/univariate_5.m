clear all
mpol x;

%stopnja polinomov
n=21;

%stevilo primerov
m=50;

%seznami koeficientov polinomov
polinomi=zeros(n,m);

%S in Z sta spodnja in zgornja meja na stopnjo hierarhije
S=ceil(n/2)-1;
Z=50;

%statusi_put in statusi_sch sta matriki, ki imata v i-ti vrstici rezultate
%za i-ti polinom, v j-tem stolpcu pa status j-te Lasserrejeve hierarhije
status_put=ones(m,Z-S-1)*(-2);
status_sch=ones(m,Z-S-1)*(-2);

%object_put in object_sch sta matriki, ki imata v i-ti vrstici rezultate
%za i-ti polinom, v j-tem stolpcu pa vrednost j-te Lasserrejeve hierarhije
object_put=zeros(m,Z-S-1);
object_sch=zeros(m,Z-S-1);

%semialgebraicna mnozica za Putinarja
K_put=[x+2>=0,(x-1)*(x-2)>=0,(x-3)*(x-4)>=0];

%semialgebraicna mnozica za Schmuedgena
K_sch=[x+2>=0,(x-1)*(x-2)>=0,(x-3)*(x-4)>=0,(x+2)*(x-1)*(x-2)>=0,(x+2)*(x-3)*(x-4)>=0,...
   (x-1)*(x-2)*(x-3)*(x-4)>=0, (x+2)*(x-1)*(x-2)*(x-3)*(x-4)>=0];

%ponavljamo raèunanje minimuma z Lasserrejevimi hierhijami
for i=1:m
    %nakljuèen polinom stopnje n-1 v eni spremenljivki
    b=rand(n,1);
    v=[x].^(0:n-1);
    f=v*b;
    polinomi(:,i)=b;
    
    %k je najmanjša Lasserejeva hierarhija
    k=ceil(n/2);
    status=-2;
    
    %resuj Putinarjevo hierarhijo
    while status<1 & k<Z
        P=msdp(min(f),K_put,k);
        [status,object]=msol(P);
        object_put(i,k-S)=object;
        status_put(i,k-S)=status;
        k=k+1;  
    end
    
    k=ceil(n/2);
    status=-2;
    
    %resuj Schmuedgenovo hierarhijo
    while status<1 & k<Z
        P=msdp(min(f),K_sch,k);
        [status,object]=msol(P);
        object_sch(i,k-S)=object;
        status_sch(i,k-S)=status;
        k=k+1;  
    end
end