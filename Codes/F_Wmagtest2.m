

%ALL air regions

kall = 8/8; 

k71 =  k_leak(71)^2; %1;
k72 =  k_leak(72)^2;
k86 = k_leak(86)^2;
k87 = k_leak(87)^2;
k88 = k_leak(88)^2;
k76 = k_leak(76)^2;
k77 = 1*k_leak(77)^2; 

W1 = abs(Ball(1)*Hall(1)*Aall(1)*lall(1));
W71 = abs(Ball(71)*Hall(71)*Aall(71)*lall(71));


W2 = 2*abs(Ball(2)*Hall(2)*Aall(2)*lall(2));
W72 = 2*abs(Ball(72)*Hall(72)*Aall(72)*lall(72));
W86 = 2*abs(Ball(86)*Hall(86)*Aall(86)*lall(86));
W87 = 2*abs(Ball(87)*Hall(87)*Aall(87)*lall(87));
W88 = 2*abs(Ball(88)*Hall(88)*Aall(88)*lall(88));

W76 = 2*abs(Ball(76)*Hall(76)*Aall(76)*lall(76)); 
W77 = 2*abs(Ball(77)*Hall(77)*Aall(77)*lall(77));

W_I1(Nstep_cur) = 1/2*CUR_out(Nstep_cur)*FLUXall(23);

Wmag_out(Nstep_cur) = kall*0.5*(W1+ k71*W71+ W2+ k72*W72+ k86*W86+ k87*W87+ k88*W88+ k76*W76+ k77*W77 )*10^-9; %this 0.5 is from W=BH/2. since W does not have it here

%%calculation of max energy change for that x

l1_temp = lall(1);
l2_temp = lall(2);

lall(1) = 0.1;
lall(2) = 0.7;

MatrixSolve_gen_9_lin

W1 = abs(Ball(1)*Hall(1)*Aall(1)*lall(1));
W71 = abs(Ball(71)*Hall(71)*Aall(71)*lall(71));

W2 = 2*abs(Ball(2)*Hall(2)*Aall(2)*lall(2));
W72 = 2*abs(Ball(72)*Hall(72)*Aall(72)*lall(72));
W86 = 2*abs(Ball(86)*Hall(86)*Aall(86)*lall(86));
W87 = 2*abs(Ball(87)*Hall(87)*Aall(87)*lall(87));
W88 = 2*abs(Ball(88)*Hall(88)*Aall(88)*lall(88));

W76 = 2*abs(Ball(76)*Hall(76)*Aall(76)*lall(76)); 
W77 = 2*abs(Ball(77)*Hall(77)*Aall(77)*lall(77));

W_I0(Nstep_cur) = 1/2*CUR_out(Nstep_cur)*FLUXall(23);

Wmag_min(Nstep_cur) = kall*0.5*(W1+ k71*W71+ W2+ k72*W72+ k86*W86+ k87*W87+ k88*W88+ k76*W76+ k77*W77)*10^-9;

FORCE_W(Nstep_cur) = -(Wmag_out(Nstep_cur) - Wmag_min(Nstep_cur)) / (l1_temp - lall(1))*10^3; %Energy is always max at min displacement! so this force is negative

FORCE_I(Nstep_cur) = -(W_I1(Nstep_cur) - W_I0(Nstep_cur)) / (l1_temp - lall(1))*10^3;

%%reverse dx change

lall(1) = l1_temp;
lall(2) = l2_temp;