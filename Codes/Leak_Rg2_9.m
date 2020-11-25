

%%%% back and back-side frindge

%%% inner(right) fringe field

%%%%also shows saturation! so only a finite number of areas can be considered

Aall(72) = 0; %internal stray flux to c4
Aall(82) = 0;

Aall(86) = 0;
Aall(87) = 0;
Aall(88) = 0;

kk=1;

as_min = 0.1;

kk_max = h5/as_min/2;  %%this is back and front stray 

step = zeros(1,kk_max);
as = zeros(1,kk_max);
As = zeros(1,kk_max);
lms = zeros(1,kk_max);
Yg2s4 = zeros(1,kk_max);
Rg2s4 = zeros(1,kk_max);

stop = 0;

while kk <= kk_max && stop ~= 1
    
    step(kk) = kk;
    
    if kk == 1
         as(1) = as_min; %first step
         As(1) = (as(kk)+(l3-l5)/2)/2*a4*1e-6; %l5 is not part of any vector
    else
         as(kk) = 2*as(1)+as(kk-1);
    end
   
      
   
    lms(kk) = Ps(lall(2)+as(kk),lall(2)/(lall(2)+as(kk))) / 4 * 1e-3; 
 
   %%all these reluctances are in parallel since flux splits when etnering them
    
    Yg2s4(kk) = mu0*As(1) / lms(kk); %%permeances
    
    if kk < kk_max
        kk = kk+1;
    else
        stop = 1;
    end
end

stop = 0; 

Yg2s_f4 = 2*sum(Yg2s4); %two sides: back and front

Aall(86) = kk*As(1)*1e6;
lall(86) = lms(round(kk_max/2))*10^3;
k_leak(86) = (lall(2)+as(round(kk_max/2)))/lall(86);
Rall(86) = Yg2s_f4^-1;

Aall(82) = Aall(82) + kk*As(1);

kk=1;

as_min = 0.1;

kk_max = round(7.5/2/as_min);  %considering that 77 is now 12, this can be 5 at most. but isnce there is so much space in the c4 making this 5 is a crime

step = zeros(1,kk_max);
as = zeros(1,kk_max);
As = zeros(1,kk_max);
lms = zeros(1,kk_max);
Yg2s1 = zeros(1,kk_max);
Rg2s1 = zeros(1,kk_max);

stop = 0;

while kk <= kk_max && stop ~= 1
    
    step(kk) = kk;
    
    if kk == 1
         as(1) = as_min; %first step
          As(1) = 3*l5*as(kk)*1e-6; %l5 is not part of any vector
          %3 because of extra cpace on c4
    else
         as(kk) = 2*as(1)+as(kk-1);
    end
       
    lms(kk) = Ps(lall(2)+as(kk),lall(2)/(lall(2)+as(kk))) / 4 * 1e-3; 
 
   %%all these reluctances are in parallel since flux splits when etnering them
    
    Yg2s1(kk) = mu0*As(1) / lms(kk); %%permeances
       
    if kk < kk_max
        kk = kk+1;
    else
        stop = 1;
    end
end

stop = 0; 

Yg2s_f1 = sum(Yg2s1);

Aall(72) = Aall(72) + kk*As(1);

lall(72) = lms(round(kk_max/2))*10^3;
k_leak(72) = (lall(2)+as(round(kk_max/2)))/lall(72);

%%%%%  outer (left) frindge field

kk=1;

as_min = 0.1;

ch_2s = (a5-a3)/2;

kk_max = round(ch_2s/2/as_min);

step = zeros(1,kk_max);
as = zeros(1,kk_max);
As = zeros(1,kk_max);
lms = zeros(1,kk_max);
Yg2s2 = zeros(1,kk_max);
Rg2s2 = zeros(1,kk_max);

while kk <= kk_max && stop ~= 1
    
    step(kk) = kk;
    
    if kk == 1
         as(1) = as_min; %first step
         As(1) = 2*l5*as(kk)*1e-6;  %l5 is not part of any vector
    else
         as(kk) = 2*as(1)+as(kk-1);
    end
       
    
    lms(kk) = Ps(lall(2)+as(kk),lall(2)/(lall(2)+as(kk))) / 4 * 1e-3; 
 
   %%all these reluctances are in parallel since flux splits when etnering them
    
    Yg2s2(kk) = mu0*As(1) / lms(kk); %%permeances
       
    if kk < kk_max
        kk = kk+1;
    else
        stop = 1;
    end
end

stop = 0; 

Yg2s_f2 = sum(Yg2s2);

Aall(87) = kk*As(1)*1e6;
lall(87) = lms(round(kk_max/2))*10^3;
k_leak(87) = (lall(2)+as(round(kk_max/2)))/lall(87);
Rall(87) = Yg2s_f2^-1;

Aall(82) = Aall(82) + kk*As(1);

%%% exterior leakage (left side)

kk=1;

as_min = 0.1;

    kk_max = round(h5/2/as_min);

step = zeros(1,kk_max);
as = zeros(1,kk_max);
As = zeros(1,kk_max);
lms = zeros(1,kk_max);
Yg2s3 = zeros(1,kk_max);
Rg2s3 = zeros(1,kk_max);

while kk <= kk_max && stop ~= 1
    
    step(kk) = kk;
    
    if kk == 1
         as(1) = as_min; %first step
         As(1) = 2*l5*as(kk)*1e-6; %l5 is not part of any vector
    else
         as(kk) = 2*as(1)+as(kk-1);
    end  
       
    lms(kk) = Ps(0.5*lall(2)+ch_2s+as(kk),(0.5*lall(2)+ch_2s)/(0.5*lall(2)+as(kk)+ch_2s)) / 2 * 1e-3; 
 
   %%all these reluctances are in parallel since flux splits when etnering them
    
    Yg2s3(kk) = mu0*As(1) / lms(kk); %%permeances
    
    if kk < kk_max
        kk = kk+1;
    else
        stop = 1;
    end
end

stop = 0; 

Yg2s_l1 = sum(Yg2s3);

Aall(88) = kk*As(1)*1e6;
lall(88) = lms(round(kk_max/2))*10^3;
k_leak(88) = 2*((0.5*lall(2)+ch_2s+as(round(kk_max/2))))/lall(88);
Rall(88) = Yg2s_l1^-1;

Aall(82) = Aall(82) + kk*As(1);

Rall(72) = (Yg2s_f1)^-1;  %%% 71 should be c2 core, but assuming that there is no "core leakage" using the 70+2 numbering 
Rall(82) = (Yg2s_f2+Yg2s_l1+Yg2s_f4)^-1;

Aall(72) = Aall(72)*1e6;
Aall(82) = Aall(82)*1e6;

