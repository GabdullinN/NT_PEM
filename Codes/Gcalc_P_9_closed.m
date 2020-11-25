%using vector of all areas Aall

Aall(31) = h3 * l3;
Aall(32) = Aall(31);
Aall(41) = a4 * l3;
Aall(42)=Aall(41);
%
Aall(51) = l5 * h5;
Aall(52) = Aall(51);
Aall(53) = Aall(51);
%
Aall(11) = pi*r1^2; 
Aall(12) = pi*r1^2; 
%
Aall(20) = pi*r2^2;
Aall(21) = pi*r2^2 - (pi*r1b^2 + pi*r1b^2)/2; %using min botl r1 
Aall(22) = pi*r2^2 - pi*r1b^2;
Aall(23) = Aall(22);
Aall(24) = Aall(22); 
% 
Aall(5) = pi*rm^2 - pi*r1b^2;
%
A1cor = Aall(20) - pi*r2b^2; 
Aall(1) = Aall(20)- pi*r2b^2;

Aall(2) = a4 * l5;

%vector of lengths for the complete (both sides') circuit

lall(1) = dmain;
lall(2) = dsub;
lall(5) = hm;

lall(11) = h1-2; %there currently are no extra regions in c1, so these two reluctances are simply connected in series as before
lall(12) = 2;
lall(21) = 2;%three regions now, for Rg1 leak(fringe), coil leak and magnet leak. There might need to be an extra one at the Rg1 side since 
lall(22) = 6;%flux lines leave the core a bit earlier than air gap region (Rg1 flux leakage, the same logic). but this seems too extreme
lall(23) = 12; 
lall(24) = 1; 
lall(31) = 12; %corresponds to the section area for the downwards coil leakage 
lall(32) = (a3-2*lall(31))/2;
lall(41) = h4-h3-15;
lall(42) = 15;
lall(51) = 2*lall(5); %for magnet leakage
lall(52) = 9.5; %the leakage logic doubles the length, but this makes reluctance inconsistent in this case. so just coil leakage length of 9.5 mm
lall(53) = (a5 - lall(51)*2 - lall(52)*2)/2;



