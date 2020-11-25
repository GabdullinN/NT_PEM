%%This is the final file for opening operation
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

TDM_opening_9 
InfoCreate
inputMu_var_P_9_lin
inputG
Gcalc_P_9_closed

%see the main file for closing for more notes

wL = -1*wc; %minus since direction of motion is reversed 

Vc(1) = 145; 

F2 = 0; %extra force mimicing JMAG approach - no force but mass is modified
finish = 0; %breaks the cycle if it goes into a loop. cannot remember the reason for looping
    
    nk_tot=zeros(1,Nsteps); %non-converged solution counter
    
while Nstep_cur <= Nsteps
              
    if Nstep_cur == 1 %no delay is needed here
    
    MatrixSolve_gen_9_step1
    
    FLUX_magnet = FLUXall(5);
    
    StepOne_9

        Lmain = 0.32*1446/1982;
                 
        di(Nstep_cur) = Vc(1)*dt/((1/C)*dt^2+Rc*dt+Lmain); 
        CUR_out(Nstep_cur) = di(Nstep_cur);
        Vc(Nstep_cur) = Vc(1) - 1/C * CUR_out(Nstep_cur) * dt;
        
        MatrixSolve_gen_9_opening_lin
        
        FLUX_mag(Nstep_cur) = FLUXall(5);
        
        FLUX_i(Nstep_cur) = FLUXall(23); %FLUX_i now has the meaning of flux internal to calculation step!
        Lci(Nstep_cur) =  wL*(FLUX_i(Nstep_cur) - FLUXall(23)) /       di(Nstep_cur);
        
        Lci(Nstep_cur) = Lmain;
                
%         Motion calc
        
        x_cur(1) = lall(1)*10^-3; %[m] %%first time calculating the force
        FORCE(1) = -1/2*(CUR_out(Nstep_cur))^2*wc^2*Perm(x_cur(Nstep_cur))+F2; %this force is only used for calculating the velocity!
        vel(1) = FORCE(Nstep_cur) / mass * dt; %[m/s]
        dx(1) = (1/2 * FORCE(Nstep_cur) /mass * dt^2)*10^3; %in [mm]; 
        x_tot(1) = dx(1);
        x_cur(1) =  x_cur(1) + dx(1);
        
        Lcx(Nstep_cur) = -300; 
        FLUX_out(Nstep_cur) = FLUX_i(Nstep_cur);
        
            
        F_Wmagtest2_opening
        
          
        if dx(Nstep_cur) ~= 0 %%% calculating the change in air gaps
                
            lall(1) = lall(1) + dx(Nstep_cur);  
            lall(2) = lall(2) + dx(Nstep_cur);
            
        end    %air gap change end
          
                  
      end %N=1 calc end


             
        
      if Nstep_cur > 1 
          
         Cur_inc_9_opening  
         
         Aall(1) = A1cor + (Aall(20)-A1cor)*((x_tot(Nstep_cur-1)+0.01)/x_max);  
         A1(Nstep_cur) = Aall(1);
                   
         MatrixSolve_gen_9_opening_lin
         Perm_tot_before(Nstep_cur) = Perm_eq;
         FLUX_mag(Nstep_cur) = FLUXall(5);
         
         FLUX_i(Nstep_cur) = FLUXall(23); %only di is included
         Lci(Nstep_cur) =  wL*(FLUX_i(Nstep_cur) - FLUX_out(Nstep_cur-1)) / di(Nstep_cur);
         
%          Motion calc
            
            FORCE(Nstep_cur) = -1/2*(CUR_out(Nstep_cur))^2*wc^2*Perm(x_cur(Nstep_cur-1))+F2; 
            
            if  finish ~= 1

            vel(Nstep_cur) = vel(Nstep_cur-1) + FORCE(Nstep_cur) / mass *  dt; %[Ns/kg] so this is m/s          
            dx(Nstep_cur) = (vel(Nstep_cur-1)*dt + 1/2 * FORCE(Nstep_cur) /mass * dt^2)*10^3; %in [mm]
            
            x_cur(Nstep_cur) = x_cur(Nstep_cur-1) + dx(Nstep_cur)*10^-3; %this is in [m]! 
            x_tot(Nstep_cur) = x_tot(Nstep_cur-1) + dx(Nstep_cur); % in [mm]!!
         
            else %when maximum displacement is reached
            
            vel(Nstep_cur) = 0 ;   
            dx(Nstep_cur) = 0;   
            x_cur(Nstep_cur) = 7.1*10^-3;
            x_tot(Nstep_cur) = 7;       
            Lcx(Nstep_cur) = 0;
            FORCE_W(Nstep_cur) = 0;
             
            end
            
                 
         if dx(Nstep_cur) ~= 0 && x_cur(Nstep_cur) < 7*10^-3    %%% calculating Lcx and final flux in case of motion
                       
                
            lall(1) = lall(1) + dx(Nstep_cur);  
            lall(2) = lall(2) + dx(Nstep_cur);
            
           
            MatrixSolve_gen_9_opening_lin
            Perm_tot_after(Nstep_cur) = Perm_eq;
            
           
            FLUX_out(Nstep_cur) = FLUXall(23); %here di AND dx are included
            Lcx(Nstep_cur) = wL*(FLUX_out(Nstep_cur) - FLUX_i(Nstep_cur)) / dx(Nstep_cur)*10^3;

            F_Wmagtest2_opening
                       
            FORCE_Pdx(Nstep_cur) = 1/2*CUR_out(Nstep_cur)^2*wc^2*(Perm_tot_after(Nstep_cur) - Perm_tot_before(Nstep_cur))/dx(Nstep_cur)*10^3;
            
         else
            finish = 1;
                  
                        
         end %Lcx calc
                  
               
      end %N>2 calc

     
%modifications for the next cycle:
t_cur = t_cur + dt;
Nstep_cur = Nstep_cur + 1;

end 

InfoOut_9_dx

figure;plot(Time,FORCE_W);

if sum(nk_tot) > 0
   
     'alarm - non-converged solutions do exist';
     ans
    sum(nk_tot)
end

toc


