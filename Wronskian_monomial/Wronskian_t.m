function BDA =Wronskian_t(n,t)

%Bidiagonal decomposition of the monpmials presented in  
%E. Mainar, J.M. Pe\~na, B. Rubio, 
%Accurate computation with Wronskian matrices (2021), Calcolo. 58, 1. 

BDA=zeros(n+1);


%Bidiagonal decomposition

%COmputation of the multipliers m_{i,j}

for i=2:n+1
     for j=1:i
         BDA(i,j)= 0;
     end
end  

 % Computation of the pivots p_{i,i}
BDA(1,1)=1;
for i=2:n+1
BDA(i,i)=(i-1)*BDA(i-1,i-1);
end
%Computation of the multipliers tilde m_{i,i}
 
for i=1:n+1

    for j=i+1:n+1
        BDA(i,j)= t;
    end
end
    


