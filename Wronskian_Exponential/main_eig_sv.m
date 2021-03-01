clear all
format longE

%Experiments results presented in
%Bidiagonal decomposition of the monpmials presented in  
%E. Mainar, J.M. Pe\~na, B. Rubio, 
%Accurate computation with Wronskian matrices (2021), Calcolo. 58, 1. 
%Experimental results in Mathematica: Wronskian_Exponential_EV_SV.nb

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

BDA=Wronskian_exponential(f,n,t); %Bidiagonal decomposition of the collocation matrix. Calcolo 2021

%Eigenvalues
 
EVB=min(TNEigenValues(BDA));
EVM=min(eig(W));
dlmwrite('EVExponentialB.csv',EVB,'precision','%.45f');
dlmwrite('EVExponentialM.csv',EVM,'precision','%.45f');

%Singular values 
 
SVB=min(TNSingularValues(BDA));
SVM=min(svd(W));
dlmwrite('SVExponentialB.csv',SVB,'precision','%.45f');
dlmwrite('SVExponentialM.csv',SVM,'precision','%.45f');




% function a=TNEigenValues(B)
%
% Computes the eigenvalues of a TN matrix with bidiagonal decomposition
% stored in B
%
% Copyright (c) 2004 Plamen Koev. See COPYRIGHT.TXT for more details.
% Written February 2003
%
% July 2015: Added the return of the eigenvector matrix V
%            Supported by SJSU's Woodward Fund

%function a=TNSingularValues(B);
%Computes the singular values of a TN matrix A with bidiagonal
% decomposition B=BD(A)
% Written February 2003
% Copyright (c) 2004 Plamen Koev. See COPYRIGHT.TXT for more details.



%

 



