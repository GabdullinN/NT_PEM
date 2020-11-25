%creatig vectors for values of interest
%Load TDM in the main file first for Nsteps

Bd_out = zeros(1,Nsteps);
Bc2_out = zeros(1,Nsteps);
Bc3_out = zeros(1,Nsteps);
FLUX_out = zeros(1,Nsteps);
FLUX_mag  = zeros(1,Nsteps);
FLUX_i = zeros(1,Nsteps);
FLUX_x = zeros(1,Nsteps);
mur3_out = zeros(1,Nsteps);
FORCE = zeros(1,Nsteps);
FORCE_W = zeros(1,Nsteps);
FORCE_W_dx = zeros(1,Nsteps);
FORCE_L = zeros(1,Nsteps);
CUR_out=zeros(1,Nsteps);
x_out=zeros(1,Nsteps);
vel=zeros(1,Nsteps);
x_cur = zeros(1,Nsteps);
x_tot = zeros(1,Nsteps);

Wmag_out = zeros(1,Nsteps);
Wmag_out_dx = zeros(1,Nsteps);
Perm_tot = zeros(1,Nsteps);
Perm_tot_before = zeros(1,Nsteps);
Perm_tot_after = zeros(1,Nsteps);

dx = zeros(1,Nsteps);

Vc = zeros(1,Nsteps);

L_out = zeros(1,Nsteps);

Lci = zeros(1,Nsteps);
Lcx = zeros(1,Nsteps);
Lcc = zeros(1,Nsteps);
dLc = zeros(1,Nsteps);

Lci_t = zeros(1,Nsteps);
Lc_xt = zeros(1,Nsteps);

%storage for values of all elements in the circuit

% murall = zeros(1,99); mu is specified in mu file

Aall = zeros(1,99);
lall = zeros(1,99); % A and l for reluctance calc
Hall = zeros(1,99);
Ball = zeros(1,99);
Rall = zeros(1,99);
MMFall = zeros(1,99);
FLUXall = zeros(1,99);
Btemp = zeros(1,99);
murtemp = zeros(1,99);

k_leak = zeros(1,99);