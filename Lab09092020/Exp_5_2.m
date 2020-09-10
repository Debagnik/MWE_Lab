%PS5_2 Simulating a optimal isotropic antenna array and calculation of HPBW
%written by Debagnik Kar 1804373

clc
clear all
close all

N=input('Number of Elements: ')    %number of isotropic antenna elements

SLL=-20                            %Desired Side lobe level

b=1/(10^(SLL/20))
order=N-1                          %Order of Tchebyscheff polynomial

xo=cosh(acosh(b)/order)

k = linspace(0,0,order)
dk = linspace(0,0,order)
xk = linspace(0,0,order)
sk = linspace(0,0,order)

for index=1:order
    k(index)=index
    dk(index)=(2*index-1)*pi/(2*order)
    xk(index)=cos(dk(index))
    sk(index)=2*acos(xk(index)/xo)
end

f=3*(10^9)
lo=3*(10^8)/f
beta=2*pi/lo
d=0.5*lo

%Calculation of Array Factor----------------------------------------------//
ang=linspace(0,pi,361);
AF=linspace(0,0,361);
AF2=linspace(0,0,361);
for index=1:361
    ag=ang(index);
    AF(index)=1;
    si=beta*d*cos(ag)
    for jj=1:order
        AF(index)=AF(index)*(exp(si*1i)-exp(sk(jj)*1i))
    end
    AF2(index)=abs(AF(index))
end
AF2(1:361)=AF2(1:361)/max(AF2);

plot(ang*180/pi,20*log10(AF2),'g')
grid on

xlabel('Elevation angle (degrees)')
ylabel('Array Factor (dB)')
title('Simulating the antenna array')

%Calculating HPBW
HPBW=0
for index=182:361
    if AF2(index)>0.707
        HPBW=2*(ang(index)-pi/2)*180/pi;
    end
end
