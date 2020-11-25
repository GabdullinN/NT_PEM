
%time in seconds
t_0 = 0;
dt = 0.0001; %0.1ms is required for voltage imput!
t_max = 1.5*0.0050; %up tp 75
Time = t_0:dt:t_max;
Nsteps = length(Time); %number of steps

x_max = 7;
x_min = 0;

% conditions

i_0 = 0;
% i_max = 3; 
di = zeros(1,Nsteps);

Nstep_cur = 1;
i_cur = i_0;
t_cur = t_0;

%tolerance of the NL loop
nmax = 50;
tol = 0.01;
B_NR = zeros(1,nmax+2);

%%%%% source voltage point sequence

C = 0.0001;
Rc = 78.6; 
wc = 1500;
mass = 2.5*0.215; %multiplier is put instead of F2 and FORCE is used to calculate displacement

Vc(1) = 103; %103 is the capasitor voltage at the end of closing operation in MEC 
