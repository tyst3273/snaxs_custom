function auto_sqw(EXP_func,handle,Q_min,Q_max,Q_npts)

    out_file_LTT=strcat(handle,'_',...
        'H',int2str(Q_min(1)),'K',int2str(Q_min(2)),'L',int2str(Q_min(3)),'_H',...
        int2str(Q_max(1)),'K',int2str(Q_max(2)),'L',int2str(Q_max(3)),'_LTT.mat');

    out_file=strcat(handle,'_',...
        'H',int2str(0.5*(Q_min(1)+Q_min(2))),'K',int2str(0.5*(Q_min(1)-Q_min(2))),'L',int2str(Q_min(3)),'_H',...
        int2str(0.5*(Q_max(1)+Q_max(2))),'K',int2str(0.5*(Q_max(1)-Q_max(2))),'L',int2str(Q_max(3)),'.mat')

    PAR=auto_PAR(EXP_func);
    [XTAL,EXP,INFO,PLOT,DATA,VECS]=params_fetch(PAR);

    PAR.INFO.e_max=100;
    PAR.INFO.e_step=0.1;
    PAR.INFO.e_min=0.1;

    PAR.INFO.bose=0;              % include bose factor
    PAR.INFO.degrees=10;          % temperature
    PAR.INFO.Q_squared=0;         % include Q^2 if 1, set to 0 if not
    PAR.INFO.one_ovr_omega=0;     % include 1/omega factor for scattering
    PAR.INFO.bragg_handling=1;    % if 1 set eng to 0.1meV, if 0 set height to 0
    PAR.INFO.kfki=0;               % include kf/ki factor

    PAR.INFO.Q_min=Q_min;  
    PAR.INFO.Q_max=Q_max;
    PAR.INFO.Q_npts=Q_npts;


    PAR=simulate_SQW(PAR);


    e=PAR.VECS.energies;
    s=PAR.VECS.strufac;
    save(out_file_LTT,'e','s');
    save(out_file,'e','s');


    clear variables;


