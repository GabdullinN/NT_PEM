%%This is the final file for closing operation
%%The main important parameters are
%%CUR_out for coil current
%%FORCE for force polynomial
%%FORCE_W for force calculated with energy method
%%Nstep_cur is current step number. 
%%x_tot and x_out are displacements. one is related to the distance between
%%sator and mover and another one is absolute displacement
%%dx is step displacement increment (calculated) and dt is time increment
%%(fixed)
%%Nsteps is intertwined with Time

%%Some comments in files are outdated.
%%common sence is to be applied

tic

clear
% clc

TDM_closing_9 %TDM parameters input: time, Nsteps, starting V and I
InfoCreate %creates matrixes for storing calculation results (both circuit and dynamics) 
inputMu_var_P_9 %permeability for branches
inputG %intup of geometrical parameters
Gcalc_P_9_open %calculation of geometry based on parameters in inputG
MotionGapMod_closing %defining initial parameters for air gap and position

wL = wc; %multiplier for inductance: MUST BE wc
    
    nk_tot=zeros(1,Nsteps); %non-converged solution counter
    
while Nstep_cur <= Nsteps
              
    if Nstep_cur == 1
    
    MatrixSolve_gen_9_step1 %solving mag circuit for step1
    
    StepOne_9 %some initial parameters required for step 1 (inductancies)
    Nstep_cur = Nstep_cur + 1;
    
    for kkk = 1:23 %23 is related to the last Vc=0 step
    FLUX_out(kkk) = FLUXall(23); %this is non-zero even for zero current due to the magnet!
    end
    
    else
        
      if Nstep_cur == 24 %%this happens to be the first non-zero voltage step
                 
        di(Nstep_cur) = Vs(Nstep_cur)*dt/((1/C)*dt^2+Rc*dt+1*Lmain); %%el circuit equation
        CUR_out(Nstep_cur) = CUR_out(Nstep_cur-1) + di(Nstep_cur);
        Vc(Nstep_cur) = Vc(Nstep_cur-1) + 1/C * CUR_out(Nstep_cur) * dt; %capacitor
        
        MatrixSolve_gen_9 %magnetic circuit solution
        
        FLUX_i(Nstep_cur) = FLUXall(23); %FLUX_i now has the meaning of flux internal to calculation step!
        %23 is the main coil flux reluctance
        Lci(Nstep_cur) =  wL*(FLUX_i(Nstep_cur) - FLUX_out(Nstep_cur-1)) / di(Nstep_cur); %inductance due to current 
                
        %
        
        x_cur(24) = x_max*10^-3; %[m] %%first time calculating the force
        FORCE(24) = -1/2*(CUR_out(Nstep_cur))^2*wc^2*Perm(x_cur(Nstep_cur)); %this force is only used for calculating the velocity!
        vel(24) = FORCE(Nstep_cur) / mass * dt; %[m/s]
        dx(24) = 0; 
        x_tot(24) = 0; 
           
        %
       
        Lcx(Nstep_cur) = 0*Lmain;   
        FLUX_out(Nstep_cur) = FLUX_i(Nstep_cur); %since there is no displacement yet
        
        Lci_t(Nstep_cur) = wL*(FLUX_out(Nstep_cur) - FLUX_out(Nstep_cur-1))/di(Nstep_cur); %this is not actually used
        Lcx_t(Nstep_cur) = 0;
        
        F_Wmagtest2 %calculation of force via Wmag
        
        if dx(Nstep_cur) ~= 0 %%% calculating the change in air gaps
                
            lall(1) = lall(1) - dx(Nstep_cur);  
            lall(2) = lall(2) - dx(Nstep_cur);
            
        end    %air gap change end
          
                  
      end %N=24 calc end
             
        
      if (Vs(Nstep_cur) ~= 0 || di(Nstep_cur-1) ~= 0) && Nstep_cur > 24 %%%for all steps after 24
          
         Cur_inc_9_mod_dx_sym  %increase coil current
         
         Aall(1) = Aall(20) - (Aall(20)-A1cor)*(x_tot(Nstep_cur-1)/x_max);  %adjustment for the bolt influence!
         A1(Nstep_cur) = Aall(1);
                            
         MatrixSolve_gen_9
         
         FLUX_i(Nstep_cur) = FLUXall(23); %only di is included
         Lci(Nstep_cur) =  wL*(FLUX_i(Nstep_cur) - FLUX_out(Nstep_cur-1)) / di(Nstep_cur); %%%since there is no motion yet
        

%%%  motion calc
            
            FORCE(Nstep_cur) = -1/2*(CUR_out(Nstep_cur))^2*wc^2*Perm(x_cur(Nstep_cur-1));

            vel(Nstep_cur) = vel(Nstep_cur-1) + FORCE(Nstep_cur) / mass * dt; %[Ns/kg] so this is m/s
            dx(Nstep_cur) = (vel(Nstep_cur-1)*dt + 1/2 * FORCE(Nstep_cur) /mass * dt^2)*10^3; %in [mm]
            
            x_cur(Nstep_cur) = x_cur(Nstep_cur-1) - dx(Nstep_cur)*10^-3; %this is in [m]! 
            x_tot(Nstep_cur) = x_tot(Nstep_cur-1) + dx(Nstep_cur); % in [mm]!!
                               
                 
         if dx(Nstep_cur) ~= 0 %%% calculating Lcx and final flux in case of motion
                                       
            lall(1) = lall(1) - dx(Nstep_cur);  
            lall(2) = lall(2) - dx(Nstep_cur);
            
            MatrixSolve_gen_9
            
%      inductance calc

            FLUX_out(Nstep_cur) = FLUXall(23); %here di AND dx are included
            Lcx(Nstep_cur) = wL*(FLUX_out(Nstep_cur) - FLUX_i(Nstep_cur)) / dx(Nstep_cur)*10^3; 
            
            Lci_t(Nstep_cur) = wL*(FLUX_out(Nstep_cur) - FLUX_out(Nstep_cur-1))/di(Nstep_cur);
            Lcx_t(Nstep_cur) = wL*(FLUX_out(Nstep_cur) - FLUX_out(Nstep_cur-1))/dx(Nstep_cur);
           
            Perm_tot(Nstep_cur) = Perm_eq;
            Perm_tot_b(Nstep_cur) = (1/1*Rg1red+1/2*R4+1*Rall(23)+1*1/2*Rall(77))^-1;
            
            F_Wmagtest2
  
            
         end %Lcx calc
                  
               
      end %N>24 calc

     
t_cur = t_cur + dt;
Nstep_cur = Nstep_cur + 1;

end %end N==1 check

end %ending the main run while loop

figure;plot(Time,FORCE_W,Time,FORCE);

if sum(nk_tot) > 0
   
     'alarm - non-converged solutions do exist';
     ans
    sum(nk_tot) %shows how many steps did not converge
end

toc


