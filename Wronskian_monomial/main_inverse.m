clear all
format longE

%Experiments results of the
%Bidiagonal decomposition of the monpmials presented in  
%E. Mainar, J.M. Pe\~na, B. Rubio, 
%Accurate computation with Wronskian matrices (2021), Calcolo. 58, 1. 

%See experimental results in Mathematica: Wronskian_Monomios_Inverse.nb


n=24

syms t

f=t

t=50 %(t >0)

BDA=Wronskian_t(n,t); %Bidiagonal decomposition of the collocation matrix. Calcolo(2021)
W=matriz_W(n,t); %Wronskian matrix


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




