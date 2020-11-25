
%coding in seconds
t_0 = 0;
dt = 0.0001; %0.1ms is required for voltage imput!
% dt = 0.005;
t_max = 0.0100; %up tp 75
Time = t_0:dt:t_max;
Nsteps = length(Time); %number of steps

x_max = 7;
x_min = 0;
% dx = (x_max - x_min) / Nsteps; %in the new version using motion
% conditions

i_0 = 0;
i_max = 3; %is not used in the final version
di = zeros(1,Nsteps);

Nstep_cur = 1;
i_cur = i_0;
t_cur = t_0;

%tolerance of the N-R loop
nmax = 50;
tol = 0.01;
B_NR = zeros(1,nmax+2);

%%%%% source voltage point sequence

C = 0.0001;
Rc = 88.9; %circuit passive elements and coil turns
wc = 1982; 
mass = 1.0*0.215;

Vs = zeros(1,Nsteps);
ii = 0;

for ii = 1:23
   
    Vs(ii) = 0;
       
end
Vs(24) = 237.2;
Vs(25) = 244.6;
Vs(26) = 251.7;
Vs(27) = 258.4;
Vs(28) = 264.7;
Vs(29) = 270.7;
Vs(30) = 276.3;
Vs(31) = 281.5;
Vs(32) = 286.3;
Vs(33) = 290.6;
Vs(34) = 294.6;
Vs(35) = 298.2;
Vs(36) = 301.3;
Vs(37) = 304;
Vs(38) = 306.3;
Vs(39) = 308.1;
Vs(40) = 309.5;
Vs(41) = 310.5;
Vs(42) = 311.0;
Vs(43) = 311.1;
Vs(44) = 310.7;
Vs(45) = 309.9;
Vs(46) = 308.7;
Vs(47) = 307;
Vs(48) = 304.8;
Vs(49) = 302.3;
Vs(50) = 299.3;
Vs(51) = 295.6;
Vs(52) = 292;
Vs(53) = 287.8;
Vs(54) = 283.1;
Vs(55) = 278.1;
Vs(56) = 272.6;
Vs(57) = 266.8;
Vs(58) = 260.6;
Vs(59) = 254;
Vs(60) = 247;
Vs(61) = 239.7;
Vs(62) = 232;
Vs(63) = 224;
Vs(64) = 215.8;
Vs(65) = 207.2;
Vs(66) = 198.3;
Vs(67) = 189;
Vs(68) = 179.7;
Vs(69) = 170;
Vs(70) = 160;
Vs(71) = 149.9;
Vs(72) = 139.5;
Vs(73) = 128.9;
Vs(74) = 118.1;
Vs(75) = 107.2;
Vs(76) = 96.1;
Vs(77) = 84.9;
Vs(78) = 73.58;
Vs(79) = 62.1;
Vs(80) = 50.6;
Vs(81) = 39;
Vs(82) = 27.3;
Vs(83) = 15.6;
Vs(84) = 3.9;

for ii = 85:Nsteps
   
    Vs(ii) = 0;
       
end

ii=0;
