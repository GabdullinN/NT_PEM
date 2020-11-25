%requires geometry
%requires constants
conv = (1e-3)/(mu0*1e-6);

%using Rall reluctance vector and murall relative permeability vector

%it is possible to write a general form of the matrix of R as lAm but
%careful! has not been tested
Rall(11) = conv * lall(11) / Aall(11) / murall(11);
Rall(12) = conv * lall(12) / Aall(12) / murall(12);
% Rall(12) = Rall(11);
Rall(1) = conv * lall(1) / Aall(1) ; %main air
Rall(21) = conv * lall(21) / Aall(21) / murall(21);
Rall(22) = conv * lall(22) / Aall(22) / murall(22);
Rall(23) = conv * lall(23) / Aall(23) / murall(23);
Rall(24) = conv * lall(24) / Aall(24) / murall(24);
Rall(5) = conv * lall(5) / Aall(5) / murall(5); %magnet
%
Rall(51) = conv * lall(51)  / Aall(51) / murall(51);
Rall(52) = conv * lall(52)  / Aall(52) / murall(52);
Rall(53) = conv * lall(53)  / Aall(53) / murall(53);
Rall(31) = conv * lall(31) / Aall(31) / murall(31);
Rall(32) = conv * lall(32) / Aall(32) / murall(32);
%two sides!
Rall(41) = conv * lall(41) / Aall(41) / murall(41);
Rall(2) = conv * lall(2) / Aall(2);

