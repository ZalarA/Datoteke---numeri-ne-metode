function y=newtonAD(x0,delta,maxsteps)

if nargin<2, delta=eps; end
if nargin<3, maxsteps=50; end

xn=x0;
deltax=2*delta*x0+1;
korak=0;                    						 
while (norm(deltax)>delta*norm(xn)) & (korak<maxsteps)
   korak=korak+1;           						 
   x0=xn;
   [y1,grad1]=gradient_f1(x0);
   [y2,grad2]=gradient_f2(x0);
   [y3,grad3]=gradient_f3(x0);
   Jac=[grad1;grad2;grad3];
   F=[y1;y2;y3];
   deltax=-Jac\F;
   xn=x0+deltax;
   disp(sprintf('%3d:  %s %0.1e',korak,sprintf('%15.15f  ',xn),norm(deltax,'inf')/norm(x0,'inf')));  % izpisemo trenutni priblizek
   norm(deltax);
end   

y=xn;