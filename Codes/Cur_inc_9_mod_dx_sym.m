


di(Nstep_cur) = ((-1/C*CUR_out(Nstep_cur-1)*dt^2)+(Vs(Nstep_cur) - Vc(Nstep_cur-1) - CUR_out(Nstep_cur-1)*Rc)*dt - Lcx(Nstep_cur-1)*dx(Nstep_cur-1)*10^-3) / (Rc*dt + Lci(Nstep_cur-1)+1/C*dt^2); 

%%devision by dx(Nstep_cur) in the original paper. 

CUR_out(Nstep_cur) = CUR_out(Nstep_cur-1) + di(Nstep_cur);
Vc(Nstep_cur) = Vc(Nstep_cur-1) + 1/C * CUR_out(Nstep_cur) * dt;

