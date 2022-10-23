%Finding a local mimimum of the function (x^2+1)^2+(y^2+1)^2+(x+y+1)^2
%with a combination of gradient descent and Broyden's method

fprintf(['Iscemo ekstreme funkcije\n'...
        ' f(x(1),x(2))=(x(1)^2+1)^2+(x(2)^2+1)^2+(x(1)+x(2)+1)^2\n'...
        'z gradientnim spustom.\n\n'
        ])

f=inline('[(x(1)^2+1)^2+(x(2)^2+1)^2+(x(1)+x(2)+1)^2]');

pause

fprintf(['Gradient funkcije je enak\n'...
        ' grad(f)(x(1),x(2))=[ 2*(x(1)^2+1)*2*x(1)+2*(x(1)+x(2)+1);'...
        ' 2*(x(2)^2+1)*2*x(2)+2*(x(1)+x(2)+1)].\n\n'
        ]);
 
gradf=inline(strcat(...
            ' [ 2*(x(1)^2+1)*2*x(1)+2*(x(1)+x(2)+1);',...
            ' 2*(x(2)^2+1)*2*x(2)+2*(x(1)+x(2)+1)]'));

pause

fprintf(['Priblizek za ekstrem pridobljen z gradientno metodo za f\n'...
        'z zacetnim priblizkom [1;1]:\n\n'])

pause

x=gradient_descent(f,gradf,[1;1])

fprintf(['Vrednost funkcije f v tocki x:\n'])

f(x)
