%{ 
This function calculates Bragg peaks by calculating S(Q,w) at hw = 0. This
particular script scans the HK0 plane and plots the S([H K 0],0) as a fuction of
H and K. It could easily be extended to scan along different plans in Q 
space.

Apparently for all intensity calculations, SNAXS just calculates E-scans.
For Q scans, it stacks a bunch of cuts of E scans to generate intensity
vs Q. For S(Q,w), it stacks a bunch of E scans into a color plot. 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Notes for me: Is S(Q,w) at hw=0 actually Bragg scattering? In Squires,
S(Q,w) proportional to the cross section from all coherent scattering
processes. It is also shown that I(Q,t) can be expanded as I(Q,inf)+I'(Q,t)
where the first part is the limiting value and the second part is the time
varying part of the function. S(Q,w) is the time Fourier transform of
I(Q,t). Fourier transforming the two parts of I(Q,t) returns a delta
funcition in w and the Fourier tranform of I'(Q,t). If we consider the
elastic scattering to be where w=0 and plug in, the delta function
overwhelms the I'(Q,t) part and S(Q,w=0) ~= the elastic cross section given
in Squires. 
%}

%% Don't change this part. This is required. 
% auto_PAR generates the data structure that is passed between most
% functions. params_fetch reads the data from PAR for use here.
PAR = auto_PAR(EXPtof);
[XTAL,EXP,INFO,PLOT,DATA,VECS]=params_fetch(PAR);

%% Calculations parameters. Change this stuff accordingly.
% define H K 0 grid
nqH = 250; % number of points along H direction
nqK = 250; % number of points along K direction
qHmin = -9; % minimum point along H direction
qHmax = 9; % maximum point along H direction
qKmin = -9; % minimum point along K direction
qKmax = 9; % maximum point along K direction

% energy cuts to make. Could do multiple energies but for Bragg scattering,
% we just want hw = 0. Set e_max and e_min = 0 to only calculate at hw = 0
PAR.INFO.e_max= 20;
PAR.INFO.e_step= 1;
PAR.INFO.e_min= 1;

%% Don't change anything below here. The rest is the calculation.
Hvals = linspace( qHmin, qHmax, nqH); % H points to calculate
Kvals = linspace( qKmin, qKmax, nqK); % K points to calculate
% It's actually a matrix of HiKj pairs.
eng = (PAR.INFO.e_min : PAR.INFO.e_step : PAR.INFO.e_max)';
nHpts = length(Hvals);
nKpts = length(Kvals);
nEpts = length(eng);

% Initialize empty array. Each slice(:,:,i) is a constant energy cut in the
% HK0 plane.
slice = zeros(nHpts,nKpts,nEpts);

% This loop generates a bunch of E-slices to form a Q scan. It then stiches
% together all the Q scans along one direction to form the 2-D plane of Q
% points. Then constant energy slices can be made along the HK0 plane. This
% is exactly what is dont when you run snaxs.m but it is automated here so
% you don't have to input a ton of Q vectors to generate the data.
for i = 1:nHpts
	disp([newline '===== Now on scan ' num2str(i) ' out of '...
        num2str(nHpts) ' =====' newline]);
	PAR.INFO.Q_min = [Hvals(i), Kvals(1), 0];
	PAR.INFO.Q_max = [Hvals(i), Kvals(end), 0];
	PAR.INFO.Q_npts = nKpts;

	PAR=simulate_SQW(PAR);
	slice(i,:,:) = PAR.DATA.SQE_array';
end

ind = 1; % index of energy cut to plot. 1 for hw = 0
fig = imagesc(Hvals,Kvals,log(slice(:,:,ind)'));
axis on
ax = gca;
axis tight normal
set(ax,'YDir','normal');
set(fig,'AlphaData',~isnan(slice(:,:,ind)'))