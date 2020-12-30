%% Don't change this part. This is required. 
% auto_PAR generates the data structure that is passed between most
% functions. params_fetch reads the data from PAR for use here.
PAR = auto_PAR(EXPtof);
[XTAL,EXP,INFO,PLOT,DATA,VECS]=params_fetch(PAR);

PAR.INFO.e_max= 40;
PAR.INFO.e_step= 0.02;
PAR.INFO.e_min= 2.5;

PAR.INFO.bose = 1;              % include bose factor
PAR.INFO.degrees = 10;          % temperature
PAR.INFO.Q_squared = 1;         % include Q^2 if 1, set to 0 if not
PAR.INFO.one_ovr_omega = 1;     % include 1/omega factor for scattering
PAR.INFO.bragg_handling = 1;    % if 1 set eng to 0.1meV, if 0 set height to 0
PAR.INFO.kfki= 1;               % include kf/ki factor

%% Don't change anything below here. The rest is the calculation.
Qpts =  [-3,0,1; -3.1,0,1; -3.2,0,1; -3.3,0,1; -3.4,0,1; -3.5,0,1; ...
         -3.6,0,1; -3.7,0,1; -3.8,0,1; -3.9,0,1; ...
         -4,0,0; -4.1,0,0; -4.2,0,0; -4.3,0,0; -4.4,0,0; -4.5,0,0; ...
         -4,0,1; -4.1,0,1; -4.2,0,1; -4.3,0,1; -4.4,0,1; -4.5,0,1; ...
         -4,0,2; -4.1,0,2; -4.2,0,2; -4.3,0,2; -4.4,0,2; -4.5,0,2; ...
         -4.6,0,2; -4.7,0,2; -4.8,0,2; -4.9,0,2; -5,0,2; ...
         -4,1,0; -4.1,1,0; -4.2,1,0; -4.3,1,0; -4.4,1,0; -4.5,1,0; ...
         -4,-1,0; -4.1,-1,0; -4.2,-1,0; -4.3,-1,0; -4.4,-1,0; -4.5,-1,0]
     
eng = (PAR.INFO.e_min : PAR.INFO.e_step : PAR.INFO.e_max)';
nQpts = length(Qpts);
nEpts = length(eng);

% Initialize empty array. Each slice(:,i) is a constant Q cut
intensity = zeros(nQpts,nEpts);
centers = zeros(nQpts,24);
heights = zeros(nQpts,24);

for i = 1:nQpts
	disp([newline '===== Now on scan ' num2str(i) ' out of '...
        num2str(nQpts) ' =====' newline]);
    [Qpts(i,1), Qpts(i,2), Qpts(i,3)]
    PAR.INFO.Q = [Qpts(i,1), Qpts(i,2), Qpts(i,3)];

    PAR=simulate_single(PAR);
    PAR=simulate_Escan(PAR);
	intensity(i,:) = PAR.DATA.int';
    centers(i,:) = PAR.DATA.allcenters;
    heights(i,:) = PAR.DATA.allheights;
end

% plot(eng,intensity(25,:),'bs',centers(25,:),heights(25,:),'rs');
% hold on;
save('intensities.mat','intensity','centers','heights','Qpts','eng');
clear variables;
load('intensities.mat');

