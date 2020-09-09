%PS 5.1 Plotting Tchebyscheff Polynomials of orders 5 and 6
% Written By Debagnik Kar 1804373

clc
clear all
close all

x=linspace(-1.5,1.5,1000)

m=input('Enter the value of order(m): ')

for i=1:1000
    if abs(x(i))<=1 
        y(i)=cos(m*acos(x(i)));
    else
        y(i)=cosh(m*acosh(x(i)));
    end
end
plot(x,y)
grid on

xlabel('Values of x --->')
ylabel('Tm(x)--->')

title('Plotting Tchebyscheff Polynomials')