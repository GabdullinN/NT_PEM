

%%%%%circuit equations start here

Rall(77)=Rall(77)*0.75;

Rcirc = zeros(8);

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

Perm_eq = (Rconst+Rg1red+1/2*R4)^-1;

Rcirc(1,1) = Rall(31)+Rall(76)+Rg1;
Rcirc(1,2) = -Rall(76);
Rcirc(1,5) = Rg1;
Rcirc(2,1) = Rcirc(1,2);
Rcirc(2,2) = Rall(23)+Rall(76)+Rall(77)+R4;
Rcirc(2,3) = -Rall(77);
Rcirc(2,6) = Rall(23);
Rcirc(3,2) = Rcirc(2,3);
Rcirc(3,3) = Rall(24)+Rall(77)+Rall(75)+Rall(52);
Rcirc(3,4) = -Rall(75);
Rcirc(3,7) = Rall(24);
Rcirc(4,3) = Rcirc(3,4);
Rcirc(4,4) = Rall(5) + Rall(51) + Rall(75);
Rcirc(4,8) = Rall(5);
Rcirc(5,1) = Rcirc(1,5);
Rcirc(5,5) = Rcirc(1,1);
Rcirc(5,6) = Rcirc(1,2);
Rcirc(6,2) = Rcirc(2,6);
Rcirc(6,5) = Rcirc(2,1);
Rcirc(6,6) = Rcirc(2,2);
Rcirc(6,7) = Rcirc(2,3);
Rcirc(7,3) = Rcirc(3,7);
Rcirc(7,6) = Rcirc(3,2);
Rcirc(7,7) = Rcirc(3,3);
Rcirc(7,8) = Rcirc(3,4);
Rcirc(8,4) = Rcirc(4,8);
Rcirc(8,7) = Rcirc(4,3);
Rcirc(8,8) = Rcirc(4,4);


% Ik = inv(Rcirc)*Ft;
I_k = Rcirc\Ft; %this is vector of currents in the solution. need to calculate real fluxes from it

%%flux calculation from loop fluxes

%%loop 1
FLUXall(31) = I_k(1);
FLUXall(11) = I_k(1)+I_k(5);
FLUXall(22) = I_k(1)+I_k(5);
FLUXall(76) = I_k(2)-I_k(1);
FLUXall(71) = (I_k(1)+I_k(5))*(Rg1par/Rall(71));
FLUXall(1) = (I_k(1)+I_k(5))*(Rg1par/(Rall(1)+Rall(21)+Rall(12)));
FLUXall(12) = FLUXall(1);
FLUXall(21) = FLUXall(1);

%%loop 2
FLUXall(23) = I_k(2)+I_k(6);
FLUXall(77) = I_k(2) - I_k(3);
FLUXall(32) = I_k(2); 
FLUXall(41) = I_k(2);
FLUXall(72) = I_k(2)*Rg2tot/Rall(72);
FLUXall(53) = I_k(2)*Rg2tot/Rg2ser;
FLUXall(42)=FLUXall(53);
FLUXall(2) = FLUXall(53)*Rg2par/Rall(2);
FLUXall(82) = FLUXall(53)*Rg2par/Rall(82);

%%loop 3
FLUXall(24) = I_k(3) + I_k(7);
FLUXall(52) = I_k(3);
FLUXall(75) = I_k(3) - I_k(4);

%%loop 4
FLUXall(5) = I_k(4)+I_k(8);
FLUXall(51) = I_k(4);

%R82 into separate fluxes 86-88
FLUXall(86) = FLUXall(82)*Rall(82) / Rall(86);
FLUXall(87) = FLUXall(82)*Rall(82) / Rall(87);
FLUXall(88) = FLUXall(82)*Rall(82) / Rall(88);


