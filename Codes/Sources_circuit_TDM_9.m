%upload geometry file first
%magnet mmf
%500 kaAm was taken as example
%900-10000 kA/m are average Hitachi values
%485 kA/m is what I can gather from the model
Hc = 485000;
Fm = 1*(Hc * hm) * 1e-3;

% % wc = 1500; %circuit constants were moved to TDM file

Fc = 1*CUR_out(Nstep_cur) * wc;
