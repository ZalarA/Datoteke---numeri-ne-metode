fprintf(['\nPrimer re�evanja ena�be x-x^(1/3)-2=0 s tangentno metodo, pri �emer',...
          ' je za�etni pribli�ek x0=3.'])
pause
f=inline('x-x^(1/3)-2')
fprime=inline('1-1/3*x^(-2/3)')
pause

tangentna(f,fprime,100)