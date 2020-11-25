# NT_PEM

These files contain codes used for calculation that were part of the study "Novel Non-Linear Transient Path Energy Method for the Analytical Analysis of the Non-Periodic and Non-Linear Dynamics of Electrical Machines in the Time Domain"

The complete description of the method is available in a paper (open access) at: https://ieeexplore.ieee.org/document/8668766

The main analysis files are Closing_Main and Opening_Main for closing and opening operations, respectively. 
All other files are supplementary for data storage, calculations, or contain necessary functions.

Because there are many files (34 support files and 2 main files), it is recommended to download all files and store them in the same folder to avoid possible errors.

Main files load all input data and plot out the results. They contain the main loop that calculates all major dynamic parameters like forces, inductances, currents, displacements. However, circuit parameters and fluxes are calculated elsewhere. Nevertheless, most of magnetic circuit data is stored in FLUX(Nsteps) parameter, so it can be plotted if needed. In fact, this was done to verify the stray flux reluctance calculations and elliptical function calculator. 

These codes were also used for analysis in other publications.
 https://ieeexplore.ieee.org/document/9044305
https://ieeexplore.ieee.org/document/9042362

Dr Nikita Gabdullin, Chung-Ang University, 2018-2020.
