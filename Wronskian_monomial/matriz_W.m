function W =matriz_W(n,t_eval)
syms t;
W=sym(zeros(n+1));

%Calculo matriz de colocación
for i=1:n+1
	for j=1:n+1
		W(i,j)=diff(t^(j-1),i-1);         
 	end 
end
t=t_eval;
W = vpa(eval(W), 100);