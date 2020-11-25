
Sources_circuit_TDM_9

Ft = [0; Fc; 0; Fm; 0; Fc; 0; Fm]; %%%%%voltage(mmf) vector

%%iterative part for BH non-linearities

nk=zeros(1,nmax+2); %%%%%non-converged solution counter  

    nk(1) = 1;
    nk(2) = 0;
    
    jj_nl = 2;
    
    while nk(jj_nl-1) >= 1 && jj_nl <= (nmax+2)
        
        if jj_nl == 2
                            
            ReluctancesMain_var_P_9
            ReluctancesLeak_9
            CircuitEq_9 %Circuit reluctances and fluxes
                                         
            Hrecalc_6_lin %B and H calc, Bchange comparison
%             Bmod_7 
            nk(jj_nl) = 1;

            Bc3_out(jj_nl) = Ball(31);
        
        else
            
            ReluctancesMain_var_P_9
            ReluctancesLeak_9
            CircuitEq_9
                               
            Hrecalc_6_lin  
            Bc3_out(jj_nl) = Ball(31);
              
        end
        
        jj_nl=jj_nl+1;

    end
    
 if jj_nl >= nmax+2
     
     'alarm - not converged';
     ans;
     Nstep_cur;
     nk_tot(Nstep_cur)=1;
     
 end     

jj_nl;




