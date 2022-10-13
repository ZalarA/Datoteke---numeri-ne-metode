function [P, t, Y] = izstrelek(kot0)
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
G = [0; 0; -9.81];
v0 = 300;
W = [5; -2; 0];
%zacetni polozaj in zacetna hitrost za Runge-Kutta metodo
phi0 = kot0(1);
theta0 = kot0(2);
V0 = v0*[cos(phi0)*cos(theta0); sin(phi0)*cos(theta0); sin(theta0)];
Y0 = [0; 0; 0; V0];
f = @(t, Y) [Y(4:6,:); G + c*(W - Y(4:6,:))*norm(W - Y(4:6,:))];
%dolzina koraka za Runge-Kutta metodo
h = 0.1;

%postavimo zacetne parametre... 
Y = Y0;
k = 1;
t = 0;
%... in resujemo z Runge-Kutta metodo dokler izstrelek ne zadane podlage.
while(true) %Nevarno... kaj pa, ce izstrelek nikoli ne zadane podlage?
	k1 = h*feval(f, t(k), Y(:, k));
	k2 = h*feval(f, t(k) + h/2, Y(:, k) + k1/2);
	k3 = h*feval(f, t(k) + h/2, Y(:, k) + k2/2);
	k4 = h*feval(f, t(k) + h, Y(:, k) + k3);
	Y(:, k+1) = Y(:, k) + (k1 + 2*k2 + 2*k3 + k4)/6;
	t(k+1) = t(k) + h;
	k = k + 1;
	if(Y(3, k) < 0)
		break
	end
end

%linearni popravek Yk, da bo res lezal na xy-ravnini
Y(:, k) = Y(:, k-1) + Y(3, k-1)/(Y(3, k-1) - Y(3, k))*(Y(:, k) - Y(:, k-1));
P = Y(1:2, k);