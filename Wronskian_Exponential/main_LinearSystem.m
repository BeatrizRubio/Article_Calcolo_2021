clear all
format longE

%Experiments results presented in
%Bidiagonal decomposition of the exponential bases presented in  
%E. Mainar, J.M. Pe\~na, B. Rubio, 
%Accurate computation with Wronskian matrices (2021), Calcolo. 58, 1. 
%Experimental results in Mathematica: Wronskian_Exponential_LinearSystem.nb

n=25;


t = zeros(1,n);

for i=1:n
    t(i)=  i/(n+1);
end

lambda=1/2;
f=@(t) exp(t*lambda); 
A=zeros(n);
BDA=zeros(n);


%Computation of the Wronskian matrix
for i=1:n
    for j=1:n
        W(i,j)= t(j)^(i-1)*f(t(j));
    end
end    

%Bidiagonal decomposition of the Wronskian matrix. Calcolo 2021
BDA=Wronskian_exponential(f,n,t); 
 
%Solve linear system Wx=b

b=[17, -31, 77, -83, 27, -11, 96, -57, 70, -64, 29, -41,...
    46, -16, 74, -1, 2, -6, 7, -5, 1, -2, 6, -7, 5];

SolBD=transpose(TNSolve(BDA,b))
SolM = W\transpose(b)

dlmwrite('sistemaExponentialB.csv',SolBD,'precision','%.45f');
dlmwrite('sistemaExponentialM.csv',SolM,'precision','%.45f');


 %function TNSolve(B,b)
%Solves a TN linear system Ax=b, where B=BD(A). (see TNSolve of Plamen Koev https://math.mit.edu/~plamen/software/TNTool.html)

%Using this bidiagonal decomposition, we can also obtaine the inverse, eigenvalues and singular values using the
%functions presented in  https://math.mit.edu/~plamen/software/TNTool.html.


 



