function [y,grad]=gradient_f1(x)
  #Dana je funkcija f(x(1),x(2))=3*x(1) - cos(x(1)*x(2)) - 3*0.6.
  #Izra�unati �elimo njen gradient s pomo�jo avtomati�nega odvajanja.
  #Uporabimo vzvratni na�in.
  
  #Izra�un funkcijske vrednosti.
  v0=x(1);
  v1=x(2);
  v2=3*v0;
  v3=v0*v1;
  v4=cos(v3);
  v5=v2-v4-1.8;
  y=v5;
  
  #Izra�un gradienta z vzvratnim na�inom.
  bary=1;
  barv5=bary;
  
  barv2=barv5;
  barv4=-barv5;
    
  barv3=barv4*(-1)*sin(v3);
  
  barv0=barv3*v1;
  barv1=barv3*v0;
  
  barv0=barv0+barv2*3;
  
  grad=[];
  grad(1)=barv0;
  grad(2)=barv1;
  grad(3)=0;
 end
