

Aall(71) = 0;

kk=1;

as_min = 0.1; %smaller as for more steps and better approximation

ext1 = (r1-r2);
    
kk_max = round(5/2/as_min);

step = zeros(1,kk_max);
as = zeros(1,kk_max);
As = zeros(1,kk_max);
lms = zeros(1,kk_max);
Yg1s = zeros(1,kk_max);
Rg1s = zeros(1,kk_max);

stop = 0;

while kk <= kk_max && stop ~= 1
    
    step(kk) = kk;
    
    if kk == 1
         as(1) = as_min; %first step
         As(1) = 3*pi*(r1+r2)/2*2*as(1)*1e-6; %r1 and r2 are not parts of any vector. complete circle (both sides)
                %here giving 3 instead of 2 for bigger area on the bottom
                %than on top
    else
         as(kk) = 2*as(1)+as(kk-1);
    end
              
    lms(kk) = Ps(0.5*lall(1)+ext1+as(kk),(0.5*lall(1)+ext1)/(0.5*lall(1)+ext1+as(kk))) / 2 * 1e-3; %%%% lall(5) is hm
 
   %%all these reluctances are in parallel since flux splits when etnering them
    
    Yg1s(kk) = mu0*As(1) / lms(kk); %%permeances
    
    for jj = 1:kk
    
    Rg1s(kk) = (sum(Yg1s))^-1;
    
    end
    
    if kk < kk_max
        kk = kk+1;
    else
        stop = 1;
    end
end

stop = 0; 

Rall(71) = (sum(Yg1s))^-1;  %%% 71 should be c1 core, but assuming that ther is no "core leakage" using the 70+1 numbering 

Aall(71) = As(1)*kk*1e6; 

lall(71) = lms(round(kk_max/2))*10^3;

k_leak(71) = (2*(0.5*lall(1)+ext1+as(round(kk_max/2))))/lall(71);
