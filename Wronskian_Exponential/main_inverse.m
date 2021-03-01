clear all
format longE

%Experiments results presented in
%Bidiagonal decomposition of the monpmials presented in  
%E. Mainar, J.M. Pe\~na, B. Rubio, 
%Accurate computation with Wronskian matrices (2021), Calcolo. 58, 1. 
%Experimental results in Mathematica: Wronskian_Exponential_Inverse.nb

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


%Inverse Matrix
IB=TNInverseExpand(BDA);
IM=inv(W);
dlmwrite('inverseExponentialB.csv',IB,'precision','%.45f');
dlmwrite('inverseExponentialM.csv',IM,'precision','%.45f');

 %function A=TNInverseExpand(B)  
%Computes directly the inverse a square TN matrix whose bidiagonal
% bidiagonal decomposition is stored in B, using the 
% results on the factorization of A and its inverse presented in:
% Ana Marco, Jose-Javier Martinez:  Accurate computations with totally 
% positive Bernstein-Vandermonde matrices.
% Electronic Journal of Linear Algebra, Volume 26 (2013): 357--380.



%

 



