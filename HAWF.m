% HAWF hydrogen atom wave function
clear all; % clear all previously saved variables
close all; % close all windows
% n = principle quantum number
% l = Azimuthal quantum number 
% m = magnetic quantum number 
% take the input of n, l, and m 
n = input('Enter Principle Quantum number: ');
l = input('Enter Azimuthal Quantum number: ');
m = input('Enter Magnetic  Quantum number: ');
% a is the bohars radius. in meters 
a = 0.529*10^(-10); 
% define shperical coordinate symbols 
% th = theta 
% phi = phi
% r = radial diatance
syms th phi r
% get the expression of normalized angular wave function
Y = NAWF(th, phi, l, m);
% get the expression of associated laguerre polynomial 
L(r) = ALUP(r, n, l);
% replace all the occurance of r with 2*r/(n*a)
L(r) = L(2*r/(n*a));
% b and c are values which will be use later on to calculate RWA
b = sqrt(((2/(n*a))^3)*((factorial(n-l-1))/(2*n*(factorial(n+l))^3)) );
c = (2*r/(n*a))^l;
% wave function
psi(r, th, phi) = b*c*exp(-r/(n*a))*L*Y;
% RWA = Radial wave function
RWF(r) = exp(-r/(n*a))*L*c/(a*n);

% the following command will calculate the different value of r
r=linspace(0, 10^(-9), 100);
% v is basically a wave function for particular value of th and phi
v = psi(r, pi/4, 0);
% u is the probability density of of u
u = abs(v).^2;
% A is a constant employed for the sake of ploting 
A = (a^1.5);
w = A*RWF(r);

% plot wave function and its probability density
plotyy(r, v, r, u); grid on;
legend('wave function', 'probability density');
title('Plot of wavefunction and its probability density');
gtext( {['Principle quantum number = ', num2str(n), ''], ['Azimuthal Quantum number = ', num2str(l)], ['Magnetic quantum number = ', num2str(m)]});
xlabel('Radial distance');
yyaxis left
ylabel('\psi');
yyaxis right
ylabel('|\psi|^2');
% plot Radial wave function 
figure;
plot(r, w); grid on;
ylabel('a^{1.5}\times R_{nl}');
xlabel('Radial Distance');
gtext({['Principle quantum number = ', num2str(n), ''], ['Azimuthal Quantum number = ', num2str(l)], ['Magnetic quantum number = ', num2str(m)]});
title('Plot of Radial wave function Vs Radial distance');