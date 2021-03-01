clear all
format longE

%Experiments results of the
%Bidiagonal decomposition of the monpmials presented in  
%E. Mainar, J.M. Pe\~na, B. Rubio, 
%Accurate computation with Wronskian matrices (2021), Calcolo. 58, 1. 
%Experimental results in Mathematica: Wronskian_Monomios_LinearSystem.nb


n=24

syms t

f=t
t=50 %(t >0)

b=[17, -31, 77, -83, 27, -11, 96, -57, 70, -64, 29, -41,...
    46, -16, 74, -1, 2, -6, 7, -5, 1, -2, 6, -7, 5];


BDA=Wronskian_t(n,t); %Bidiagonal decomposition of the collocation matrix.
W=matriz_W(n,t); %Wronskian matrix

 
%Solve linear system Wx=b

SolBD=transpose(TNSolve(BDA,b))
SolM = W\transpose(b)
dlmwrite('sistemaMonomiosB.csv',SolBD,'precision','%.45f');
dlmwrite('sistemaMonomiosM.csv',SolM,'precision','%.45f');

%function TNSolve(B,b)
%Solves a TN linear system Ax=b, where B=BD(A). (see TNSolve of Plamen Koev https://math.mit.edu/~plamen/software/TNTool.html)

%Using this bidiagonal decomposition, we can also obtaine the inverse, eigenvalues and singular values using the
%functions presented in  https://math.mit.edu/~plamen/software/TNTool.html.





