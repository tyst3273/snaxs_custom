
function auto_sqw(EXP_func,handle,Qiarr,Qfarr,Q_npts)

    % this interfaces with snaxs and saves the structure factors s
    % and eigenvalues e to a *.mat file. Qi and Qf can be set of Qs
    % and they are looped over, writing the results for each set to
    % a file. Q_npts is the same for all.
    %
    % the ouput file name is different for each as created below
    
    nQ1 = size(Qiarr);
    nQ2 = size(Qfarr);
    if nQ1(1) ~= nQ2(1)
        error('Qiarr and Qfarr are not the same shape')
    end 
    nQ = nQ1(1);

    for qq = 1 : nQ
    
        Qi = Qiarr(qq,:); 
        Qf = Qfarr(qq,:); 
        
        out_file=strcat(handle,'_','H',num2str(Qi(1),'%2.2f'),...
            'K',num2str(Qi(2),'%2.2f'),'L',num2str(Qi(3),'%2.2f'), ...
            '_H',num2str(Qf(1),'%2.2f'),'K',num2str(Qf(2),'%2.2f'),...
            'L',num2str(Qf(3),'%2.2f'),'.mat')
 
        % this sets up the PAR struct that is passed into the snaxs
        % subroutines
        PAR=auto_PAR(EXP_func);
        [XTAL,EXP,INFO,PLOT,DATA,VECS]=params_fetch(PAR);

        % none of these matter and are really only used to keep snaxs
        % from complaining
        PAR.INFO.e_max=100;
        PAR.INFO.e_step=50;
        PAR.INFO.e_min=0.1;
        PAR.INFO.bose=0;           
        PAR.INFO.degrees=10;       
        PAR.INFO.Q_squared=0;      
        PAR.INFO.one_ovr_omega=0; 
        PAR.INFO.bragg_handling=1; 
        PAR.INFO.kfki=0;           

        % these ARE used. they are the Q points in S(Q,w)
        PAR.INFO.Qi=Qi;  
        PAR.INFO.Qf=Qf;
        PAR.INFO.Q_npts=Q_npts;

        % this gets the structure factors
        PAR=simulate_SQW(PAR);

        % this gets the data from the struct
        e=PAR.VECS.energies;
        s=PAR.VECS.strufac;

        % and saves it willy nilly
        save(out_file,'e','s');

        clearvars PAR XTAL EXP INFO PLOT DATA VECS e s

    end
    



