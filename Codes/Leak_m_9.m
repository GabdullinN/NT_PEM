
Aall(75) = 0;

kk=1;

as_min = 0.1; %%%%currently assuming that the height of the leak region is hm/2

kk_max = round(1/2/(2*as_min)); %giving the magnet leakage just 1mm

ms_A = 2;

step = zeros(1,kk_max);
as = zeros(1,kk_max);
As = zeros(1,kk_max);
lms = zeros(1,kk_max);
Yms = zeros(1,kk_max);
Rms = zeros(1,kk_max);

stop = 0;

while kk <= kk_max && stop ~= 1
    
    step(kk) = kk;
    
    if kk == 1
         as(1) = as_min; %first step
         As(1) = ms_A*2*as(1)*2*pi*rm/2*1e-6; %two sides indep
    else
         as(kk) = 2*as(1)+as(kk-1);
    end
    
         
    lms(kk) = Ps(lall(5)+as(kk),lall(5)/(lall(5)+as(kk))) / 4 * 1e-3; %%%% lall(5) is hm
    
    Yms(kk) = mu0*As(1) / lms(kk); %%permeances
    
    if kk < kk_max
    kk = kk+1;
    else
        stop = 1;
    end
end

stop = 0; 

Rall(75) = (sum(Yms))^-1;

Aall(75) = As(1)*kk*1e6;

lall(75) = lms(round(kk_max/2))*10^3;