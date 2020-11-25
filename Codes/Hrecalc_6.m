

ii = 0;

%air-like reluctnaces

for ii = 1:10 
    
    if murall(ii) == 0
        ;
    else 
      
        Ball(ii) = FLUXall(ii)/Aall(ii) / 1e-6;
        Hall(ii) = Ball(ii) / mu0 / murall(ii);
        
    end
end

%core reluctances

for ii = 10:59 
    
    if murall(ii) == 0
        ;
    else 
        
       %%% combining with the NH point motion check for BH non-linearity
       %%% calculation  
       
        Btemp = Ball(ii); %stores the value carried on from the previous iteration step

        Ball(ii) = FLUXall(ii)/Aall(ii) / 1e-6;
        Hall(ii) = Ball(ii) / mu0 / murall(ii);
        
        if abs((Ball(ii)-Btemp)/max(Ball(ii),Btemp)) > tol
           nk(jj_nl) = nk(jj_nl)+1; %counts steps in the main iteration loop! 
           %nonconv_detect(ii) = jj_nl;
        end
        
    end
end

%leakage and other reluctances

for ii = 60:99 
    
    if murall(ii) == 0
        ;
    else 

        Ball(ii) = FLUXall(ii)/Aall(ii) / 1e-6;
        Hall(ii) = Ball(ii) / mu0 / murall(ii);
        
    end
end

