pi = 3.1416;

mu0 = 4*3.14*1e-7;
murci = 4000;

murall = zeros(1,99);

murall(1) = 1; %air
murall(2) = 1;
murall(11) = murci;
murall(12) = murci;
murall(21) = murci; 
murall(22)= murci;
murall(23)= murci;
murall(24)= murci;
murall(31)= murci;
murall(32)= murci;
murall(41)= murci;
murall(42)= murci;
murall(51) = murci;
murall(52) = murci;
murall(53) = murci;

murall(5) = 1.05; %magnet

murm = 1.05;
murcoil = 1;

murall(71) = 1;
murall(72) = 1;
murall(75) = 1;
murall(76) = 1;
murall(77) = 1;

murall(82) = 1;
murall(86) = 1;
murall(87) = 1;
murall(88) = 1;