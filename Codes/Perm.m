function [ Pdyn ] = Perm( x )
%this function is a polinomial obtained by applying d/dx to total circuit
%permeance. F=-1/2*I^2*wc^2*Perm. input x is in [m]! 7 mm = 0.007 m!

A = -1.481e-9 / (x^2 + 0.92*x + 0.212);

B = -2.272e-10 / (x^2 + x*7.2*10^-3 + 1.297e-5);

C = -6.177e-13 / (x^2 + x*1.948e-3 + 9.484*10^-7);

D = -7.653e-11 / (x^2 + x*5.33*10^-3 + 7.1*10^-6);

E = - 1.072e-10 / (x^2 + x*5.724*10^-4 + 8.192*10^-8);

F = -2.945e-10 / (x^2 + 0.013*x+3.932e-5);

Pdyn = A + B + C + D + E + F;


end

