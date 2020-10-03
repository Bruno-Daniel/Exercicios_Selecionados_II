clc
clear
disp("Valores de di_dt")
E=@(t)e^(-0.06*pi*t)*sin(2*t-pi)
E1=@(t)((1/50)*(-100*e^((-3/50)*t*pi)*cos(2*t)+3*pi*e^((-3/50)*t*pi)*sin(2*t)))
E2=@(t)((1/2500)*(10000*e^((-3/50)*t*pi)*sin(2*t)+600*pi*e^((-3/50)*t*pi)*cos(2*t)-9*pi^(2)*e^((-3/50)*t*pi)*sin(2*t)))
di_dt=@(t)0.3*E2(t)+(1/1.4)*E1(t)+(1/1.7)*E(t)
disp("Definindo as Variaveis")
disp("")
i=zeros(100,1);
t=zeros(100,1);
h=0.1
i0=0
disp("")
disp("Calculo dos valor i_1 até i_100")
disp("")
for k=1:100
  t(k,1)=h*k;
  if k==1
    i(1,1)=i0+di_dt(0)*h;
    else
    i(k,1)=i(k-1,1)+di_dt(t(k-1,1))*h;
  endif
endfor
disp("Ajustando os valores de i e t para a plotagem do Grafico")
disp("")
I=zeros(101,1);
T=zeros(101,1);
for k=1:100
  I(k+1,1)=i(k,1);
  T(k+1,1)=t(k,1);
endfor
disp("")
disp("Valores de t:")
disp("")
display(T)
disp("")
disp("Valores de i:")
disp("")
display(I);
plot(T,I)