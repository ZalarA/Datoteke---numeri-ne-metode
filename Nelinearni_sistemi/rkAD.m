function [theta0] = rkAD(kot0)
%[P, t, Y] = izstrelek([phi0;theta0]) poisce tocko P = [x;y] na
%xy-ravnini, v kateri izstrelek iz topa v tocki X0 = [0;0;0] 
%z zacetno hitrostjo v0*[cos(phi0)*cos(theta0); sin(phi0)*cos(theta0); sin(theta0)] 
%zadane ravno podlago. Izstrelek se po 2. Newtonovem zakonu pod vplivom gravitacijske 
%sile in zracnega upora giba v skladu z enacbo
%
%	d^2 X
%	----- = G + c(W - V)*norm(W - V), 
%	d t^2
%
%kjer je:
%	c = 0.004 koeficient upora zraka
%	G = [0;0;-9.81] gravitacijski pospesek
%	W izbrana (konstantna) hitrost vetra
%		dX
%	V = -- trenutna hitrost izstrelka
%		dt

%definiramo konstante in funkcije
c = 0.004;
G = [0; -9.81];
v0 = 300;
W = [5; 0];
H=1;
%zacetni polozaj in zacetna hitrost za Runge-Kutta metodo
theta0 = kot0;
while H>10^(-8)
  V0 = v0*[cos(theta0); sin(theta0)];
  dotV0=v0*[-sin(theta0); cos(theta0)];
  Y0 = [0; 0; V0];
  dotY0=[0;0;dotV0];
  %dolzina koraka za Runge-Kutta metodo
  h = 0.1;

  %postavimo zacetne parametre... 
  Y = Y0;
  dotY=dotY0;
  k = 1;
  t = 0;
  
  %f = [Y(3:4,:); G + c*(W - Y(3:4,:))*norm(W - Y(3:4,:))];
  %f = @(t, Y) [Y(3:4,:); G + c*(W - Y(3:4,:))*norm(W - Y(3:4,:))];

  %... in resujemo z Runge-Kutta metodo dokler izstrelek ne zadane podlage.
  while(true) %Nevarno... kaj pa, ce izstrelek nikoli ne zadane podlage?
	  %k1 = h*feval(f, t(k), Y(:, k));
	  k1 = h* [Y(3:4,k); G + c*(W - Y(3:4,k))*norm(W - Y(3:4,k))];
    dotk1 = h*[dotY(3:4,k); c*(-dotY(3:4,k))*norm(W - Y(3:4,k))+c*(W - Y(3:4,k))*(1/2/norm(W - Y(3:4,k)))*(2*(W(1)-Y(3,k))*-dotY(3,k)+2*(W(2)-Y(4,k))*-dotY(4,k))];
    %k2 = h*feval(f, t(k) + h/2, Y(:, k) + k1/2);
    k2=  h* [Y(3:4,k)+k1(3:4)/2; G + c*(W - Y(3:4,k)-k1(3:4)/2)*norm(W - Y(3:4,:)-k1(3:4)/2)];
    dotk2 = h* [dotY(3:4,k)+dotk1(3:4)/2; c*(-dotY(3:4,k)-dotk1(3:4)/2)*norm(W - Y(3:4,k)-k1(3:4)/2)+c*(W - Y(3:4,k)-k1(3:4)/2)*1/2/norm(W - Y(3:4,k)-k1(3:4)/2)*(-1)*(2*(W(1)-Y(3,k)-k1(3)/2)*(dotY(3,k)+dotk1(3)/2)+2*(W(2)-Y(4,k)-k1(4)/2)*(dotY(4,k)+k1(4)/2))];
	  %k3 = h*feval(f, t(k) + h/2, Y(:, k) + k2/2);
    k3 = h*[Y(3:4,k)+k2(3:4)/2; G + c*(W - Y(3:4,k)-k2(3:4)/2)*norm(W - Y(3:4,:)-k2(3:4)/2)];
    dotk3 = h* [dotY(3:4,k)+dotk2(3:4)/2; c*(- dotY(3:4,k)-dotk2(3:4)/2)*norm(W - Y(3:4,k)-k2(3:4)/2)+c*(W - Y(3:4,k)-k2(3:4)/2)*1/2/norm(W - Y(3:4,k)-k2(3:4)/2)*(-1)*(2*(W(1)-Y(3,k)-k2(3))*(dotY(3,k)+dotk2(3)/2)+2*(W(2)-Y(4,k)-k2(4)/2)*(dotY(4,k)+k2(4)/2))];
	  %k4 = h*feval(f, t(k) + h, Y(:, k) + k3);
    k4 = h*[Y(3:4,k)+k3(3:4); G + c*(W - Y(3:4,k)-k3(3:4))*norm(W - Y(3:4,:)-k3(3:4))];
    dotk4 = h* [dotY(3:4,k)+dotk3(3:4); c*(- dotY(3:4,k)-dotk3(3:4))*norm(W - Y(3:4,k)-k3(3:4))+c*(W - Y(3:4,k)-k3(3:4))*1/2/norm(W - Y(3:4,k)-k3(3:4))*(-1)*(W(1)-2*(Y(3,k)-k3(3))*(dotY(3,k)+dotk3(3))+2*(W(2)-Y(4,k)-k3(4))*(dotY(4,k)+k3(4)))];
	  Y(:, k+1) = Y(:, k) + (k1 + 2*k2 + 2*k3 + k4)/6;
    dotY(:,k+1)=dotY(:,k)+(dotk1+2*dotk2+2*dotk3+dotk4)/6;
  	t = t + h;
	  k = k + 1;
	  if(Y(2, k) < 0)
      Y(2,k);
      Y(1,k);
	  	break
    end
  end
Y(:, k) = Y(:, k-1) + Y(2, k-1)/(Y(2, k-1) - Y(2, k))*(Y(:, k) - Y(:, k-1));
Y(:,k)
H=(400-Y(1,k))^2
dotH=-2*(400-Y(1,k))*dotY(1,k);
if H>10^(-8)
  theta0=theta0-H/dotH
end

%linearni popravek Yk, da bo res lezal na xy-ravnini


end