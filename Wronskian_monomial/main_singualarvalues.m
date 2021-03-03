clear all
format longE

%Experiments results of the
%Bidiagonal decomposition of the monpmials presented in  
%E. Mainar, J.M. Pe\~na, B. Rubio, 
%Accurate computation with Wronskian matrices (2021), Calcolo. 58, 1. 
%%Experimental results in Mathematica: Wronskian_Monomios_SingularValues.nb


n=24

syms t

f=t;

t=50 %(t >0)



%Wronskian matrix of monomial bases
W=zeros(n+1);
for i=1:n+1
	for j=1:n+1
	W(i,j)=eval( diff(((f))^(j-1),i-1));
 	end 
end


%Bidiagonal decomposition of the Wronskian matrix. Calcolo(2021)
BDA=Wronskian_t(n,t);

%Singular values 
 
SVB=min(TNSingularValues(BDA));
SVM=min(svd(W));
dlmwrite('VSMonomiosB.csv',SVB,'precision','%.45f');
dlmwrite('VSMonomiosM.csv',SVM,'precision','%.45f');


%function a=TNSingularValues(B);
%Computes the singular values of a TN matrix A with bidiagonal
% decomposition B=BD(A)
% Written February 2003
% Copyright (c) 2004 Plamen Koev. See COPYRIGHT.TXT for more details.





