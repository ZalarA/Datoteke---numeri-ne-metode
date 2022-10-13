function [y,grad]=gradient_f2(x)
  #Dana je funkcija f(x(1),x(2),x(3))=x(1)^2 - 81*(x(2)+0.1)^2 + sin(x(3)) + 1.1.
  #Izraèunati želimo njen gradient s pomoèjo avtomatiènega odvajanja.
  #Uporabimo vzvratni naèin.
  
  #Izraèun funkcijske vrednosti.
  v0=x(1);
  v1=x(2);
  v2=x(3);
  v3=v0^2;
  v4=81*(v1+0.1)^2;
  v5=sin(v2);
  v6=v3-v4+v5+1.1;
  y=v6;
 
  #Izraèun gradienta z vzvratnim naèinom.
  bary=1;
  barv6=bary;
  
  barv3=barv6;
  barv4=-barv6;
  barv5=barv6;
    
  barv2=barv5*cos(v2);
  
  barv1=barv4*2*(v1+0.1)*81;
  
  barv0=barv3*2*v0;
  
  grad=[];
  grad(1)=barv0;
  grad(2)=barv1;
  grad(3)=barv2;
 end

