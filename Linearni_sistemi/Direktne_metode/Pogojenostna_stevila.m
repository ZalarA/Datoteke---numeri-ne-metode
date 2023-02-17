disp(sprintf('\nRa�unanje pogojenostnega �tevila nekaterih matrik.\n'))
pause

disp(sprintf('\nIskanje prese�i��a dveh pravokotnih premic x+y=1, x-y=2.\n'))
pause

disp(sprintf('\nMatrika sistema je\n'))
A=[1 1; 1 -1]
pause

disp(sprintf('Pogojenostno stevilo v 1-normi matrike A= %1.3f', cond(A,1)))
disp(sprintf('Pogojenostno stevilo v 2-normi matrike A= %1.3f', cond(A,2)))
disp(sprintf('Pogojenostno stevilo v Frobeniusovi normi matrike A= %1.3f', cond(A,'fro')))
disp(sprintf('Pogojenostno stevilo v supremum-normi matrike A= %1.3f', cond(A,Inf)))

disp(sprintf('\nIskanje prese�i��a dveh skoraj vzporednih premic x+0.99y=1, 0.99x+0.98y=2.\n'))
pause

disp(sprintf('\nMatrika sistema je\n'))
A=[1 0.99; 0.99 0.98]
pause

disp(sprintf('Pogojenostno stevilo v 1-normi matrike A= %1.3f', cond(A,1)))
disp(sprintf('Pogojenostno stevilo v 2-normi matrike A= %1.3f', cond(A,2)))
disp(sprintf('Pogojenostno stevilo v Frobeniusovi normi matrike A= %1.3f', cond(A,'fro')))
disp(sprintf('Pogojenostno stevilo v supremum-normi matrike A= %1.3f', cond(A,Inf)))
pause

disp(sprintf('\nHilbertova matrika:\n'))
pause

disp(sprintf('\nH(i, j) = 1 / (i + j - 1)\n'))
pause
%H(i, j) = 1 / (i + j - 1)

H=hilb(5)
pause

disp(sprintf('Pogojenostno stevilo Hilbertove matrike H velikosti 5= %1.3f\n', cond(H)))
pause
disp(sprintf('Pogojenostno stevilo nakljucne matrike velikosti 5= %1.3f\n', cond(rand(5))))
pause

%S Hilbertovo matriko velikosti 15x15 re�ujemo sistem Hx=v, kjer je v=H*[1,...,1]^T
%Rezultat x bi moral biti [1,...,1]^T, toda x-[1,...,1]^T ni enak 0.
H=hilb(15); v=H*ones(15,1); x=H\v; 

disp(sprintf('Naj bo H Hilbertova matrika velikosti 15 in v=H*u, kjer je u vektor samih 1.\n'))
pause
disp(sprintf('Resujemo sistem Hx=v. Resitev bi moral biti vektor samih 1.\n'))
pause
disp(sprintf('Dobimo pa'))
x
pause
disp(sprintf('Norma napake x-u je=%1.5f', norm(x-ones(15,1))))


