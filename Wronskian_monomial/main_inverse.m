clear all
format longE

%Experiments results of the
%Bidiagonal decomposition of the monpmials presented in  
%E. Mainar, J.M. Pe\~na, B. Rubio, 
%Accurate computation with Wronskian matrices (2021), Calcolo. 58, 1. 

%See experimental results in Mathematica: Wronskian_Monomios_Inverse.nb


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

%Inverse Matrix
IB=TNInverseExpand(BDA);
IM=inv(W);
dlmwrite('inversaMonomiosB.csv',IB,'precision','%.45f');
dlmwrite('inversaMonomiosM.csv',IM,'precision','%.45f');

 %function A=TNInverseExpand(B)  
%Computes directly the inverse a square TN matrix whose bidiagonal
% bidiagonal decomposition is stored in B, using the 
% results on the factorization of A and its inverse presented in:
% Ana Marco, Jose-Javier Martinez:  Accurate computations with totally 
% positive Bernstein-Vandermonde matrices.
% Electronic Journal of Linear Algebra, Volume 26 (2013): 357--380.



%




