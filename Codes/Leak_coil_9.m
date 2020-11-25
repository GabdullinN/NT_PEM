
%%%two regions for coil leakage: one to the bottom core and another to the
%%%upper core. as previous observations suggest the latter should matter
%%%more

Aall(77) = 0;
Aall(76) = 0;

kk=1;

as_min = 0.2; %%%%the upper part occupies 9.5mm, a half of 19; the lower is 9.5 - d up to h1

kk_max = round(12/(2*as_min)); %giving this 12 to increase its permeance

step = zeros(1,kk_max);
as = zeros(1,kk_max);
As = zeros(1,kk_max);
lms = zeros(1,kk_max);
Ycls1 = zeros(1,kk_max);
Rcls1 = zeros(1,kk_max);

stop = 0; 

ks_A = 0.86*1.75; %area multiplier 

%%%upper leakage

while kk <= kk_max && stop ~= 1
    
    step(kk) = kk;
    
    if kk == 1
         as(1) = as_min; %first step
         As(1) = ks_A*2*as(1)*2*pi*r2*1e-6/2; %a half because considering two sides indipendently
         %%1.25 comes from consideration of max area on c5 to the available
         %%area, which is 408 agains 327
    else
         as(kk) = 2*as(1)+as(kk-1);
    end
    
    lms(kk) = Ps(lall(5)+lall(5)/2+as(kk),(lall(5)+lall(5)/2)/(lall(5)+lall(5)/2+as(kk))) / 4 * 1e-3; %%%% lall(5) is hm
 
   %%all these reluctances are in parallel since flux splits when etnering them
    
    Ycls1(kk) = mu0*As(1) / lms(kk); %%permeances
    
    if kk < kk_max
        kk = kk+1;
    else
        stop = 1;
    end
end

stop = 0; 

Rall(77) = sum((Ycls1))^-1; %%coil rel are separated since they are in different branches!

Aall(77) = As(1)*kk*1e6;

lall(77) = lms(round(kk_max/2))*1e3;

k_leak(77) = (lall(5)+lall(5)/2+as(round(kk_max/2)))/lall(77);

%%%bottom leakage

mm = 1;

as_min = 0.2;
    
mm_max = round(6/(2*as_min)); %giving this one 6 and 3 multiplier
h_ext = h1+1;

% end

step = zeros(1,mm_max);
as = zeros(1,mm_max);
As = zeros(1,mm_max);
lms = zeros(1,mm_max);
Ycls2 = zeros(1,mm_max);
Rcls2 = zeros(1,mm_max);

stop = 0; 

while mm <= mm_max && stop ~= 1
    
    step(mm) = mm;
    
    if mm == 1
         as(mm) = as_min; %first step
         As(1) = 3*as(1)*2*pi*r2*1e-6/2; %two sides independently
    else
         as(mm) = 2*as(1)+as(mm-1);
    end
   
    lms(mm) = Ps(h1+lall(1)+h_ext+as(mm),(h1+lall(1)+h_ext)/(h1+lall(1)+h_ext+as(mm))) / 4 * 1e-3; %%%% lall(5) is hm
 
   %%all these reluctances are in parallel since flux splits when etnering them
    
    Ycls2(mm) = mu0*As(1) / lms(mm); %%permeances
    
    if mm < mm_max
        mm = mm+1;
    else
        stop = 1;
    end
end

stop = 0; 

Rall(76) = (sum(Ycls2))^-1;

Aall(76) = As(1)*mm*1e6;

lall(76) = lms(round(mm_max/2))*1e3;

k_leak(76) = (h1+lall(1)+h_ext+as(round(mm_max/2)))/lall(76);
