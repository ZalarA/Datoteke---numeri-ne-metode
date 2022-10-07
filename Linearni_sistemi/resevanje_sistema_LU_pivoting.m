disp(sprintf('Resujemo sistem Ax=b s pomoèjo LU razcepa z delnim pivotiranjem'))
pause

A=[2 1 3 -4; -4 -1 -4 7; 2 3 5 -3; -2 -2 -7 9]
pause

b=[8; -14; 7; -16]
pause

[L,U,P]=lu_pivoting(A)
pause

y=prema_sub(L,P*b)
pause

x=obratna_sub(U,y)
