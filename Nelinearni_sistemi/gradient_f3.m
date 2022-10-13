function [y,grad]=gradient_f3(x)
  #Dana je funkcija f(x(1),x(2),x(3))=exp(-x(1)*x(2)) + 20*x(3) + 9.1.
  #Izraèunati želimo njen gradient s pomoèjo avtomatiènega odvajanja.
  #Uporabimo vzvratni naèin.
  
  #Izraèun funkcijske vrednosti.
  v0=x(1);
  v1=x(2);
  v2=x(3);
  v3=-v0*v1;
  v4=exp(v3);
  v5=20*v2;
  v6=v4+v5+9.1;
  y=v6;
 
  #Izraèun gradienta z vzvratnim naèinom.
  bary=1;
  barv6=bary;
  
  barv4=barv6;
  barv5=barv6;
    
  barv2=barv5*20;
  
  barv3=barv4*exp(v3);
  
  barv0=barv3*(-v1);
  barv1=barv3*(-v0);
  
  grad=[];
  grad(1)=barv0;
  grad(2)=barv1;
  grad(3)=barv2;
 end

