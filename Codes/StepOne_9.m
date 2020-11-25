
di(1) = 0;
dx(1) = 0;
CUR_out(1) = 0;

Rall(77)=Rall(77)*0.75; %%%Total permeance calculation

Rg2par = (Rall(2)^-1 + Rall(82)^-1)^-1;
Rg2ser = Rg2par+Rall(53)+Rall(42);
Rg2tot = (Rg2ser^-1 + Rall(72)^-1)^-1;
R4 = Rall(32)+Rall(41)+Rg2tot; %c4 branch eq rel

Rg1par = (Rall(71)^-1 + (Rall(1)+Rall(21)+Rall(12))^-1)^-1;
Rg1 = Rg1par + Rall(11) + Rall(22); %main gap branch eq rel

Rmred = ((Rall(5)+1/2*Rall(51))^-1 + (1/2*Rall(75))^-1)^-1;
R2 = ((Rall(24) + Rmred + 1/2*Rall(52))^-1 + (1/2*Rall(77))^-1)^-1;
Rconst = R2 + Rall(23);

Rg1red = ((Rg1 + 1/2*Rall(31))^-1 + (1/2*Rall(76))^-1)^-1;

Perm_tot(Nstep_cur) = (Rconst+Rg1red+1/2*R4)^-1;

Lmain = wc^2 * Perm_tot(Nstep_cur);
