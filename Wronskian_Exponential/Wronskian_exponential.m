function BDA =Wronskian_exponential(f,n,t)

%Bidiagonal decomposition of the monpmials presented in  
%E. Mainar, J.M. Pe\~na, B. Rubio, 
%Accurate computation with Wronskian matrices (2021), Calcolo. 58, 1. 

BDA=zeros(n);


%Bidiagonal decomposition

%COmputation of the multipliers m_{i,j}

for i=1:n
    for j=1:i-1
        BDA(i,j)=(t(j));
    end
end   

 % Computation of the pivots p_{i,i}
BDA(1,1)=f(t(1));
for i=2:n
    M=f(t(i));
    aux=1;
   for k=1:i-1
     aux =aux* (t(i)-t(k));
     BDA(i,i)=M*aux;
   end
end 
%Computation of the multipliers tilde m_{i,i}
 
for j=2:n
    BDA(1,j)=f(t(j))*f(-t(j-1));
end

for j=3:n
    for i=2:j-1
        aux=1;
       for k=1:i-1
           aux=aux*(t(j)-t(j-k))/(t(j-1)-t(j-k-1));
       end    
          BDA(i,j)=aux*f(t(j))*f(-t(j-1));
    end
end



