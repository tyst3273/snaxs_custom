function auto_sqw(EXP_func,handle,Q_min,Q_max,Q_npts)

    out_file=strcat(handle,'.mat')

    PAR=auto_PAR(EXP_func);
    [XTAL,EXP,INFO,PLOT,DATA,VECS]=params_fetch(PAR);

    PAR.INFO.e_max=100;
    PAR.INFO.e_step=0.5;
    PAR.INFO.e_min=0.1;

    PAR.INFO.bose=1;              % include bose factor
    PAR.INFO.degrees=300;          % temperature
    PAR.INFO.Q_squared=1;         % include Q^2 if 1, set to 0 if not
    PAR.INFO.one_ovr_omega=1;     % include 1/omega factor for scattering
    PAR.INFO.bragg_handling=0;    % if 1 set eng to 0.1meV, if 0 set height to 0
    PAR.INFO.kfki=1;               % include kf/ki factor

    PAR.INFO.Q_min=Q_min;  
    PAR.INFO.Q_max=Q_max;
    PAR.INFO.Q_npts=Q_npts;


    PAR=simulate_SQW(PAR);


    e=PAR.VECS.energies;
    s=PAR.VECS.strufac;
    save(out_file,'e','s');


    clear variables;


