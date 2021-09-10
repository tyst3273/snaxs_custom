Q_npts=301; 

% --------------------------------------------------------------------- 
% 0 -3 x

Qi = [0 -3 -6];
Qf = [0 -3 -4];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts);
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts);
disp(' -----------------------------------------');

% --------------------------------------------------------------------- 
% 1 x -8

Qi = [1 -2 -8];
Qf = [1  2 -8];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts)
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts)
disp(' -----------------------------------------')

% --------------------------------------------------------------------- 
% 2 x -8

Qi = [2 1 -8];
Qf = [2 3 -8];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts)
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts)
disp(' -----------------------------------------')

% --------------------------------------------------------------------- 
% -5 -6 x

Qi = [-5 -6 -7];
Qf = [-5 -6 -4];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts)
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts)
disp(' -----------------------------------------')

% --------------------------------------------------------------------- 
% -6 -6 x

Qi = [-6 -6 -4];
Qf = [-6 -6 -1];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts)
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts)
disp(' -----------------------------------------')

% --------------------------------------------------------------------- 
% 0 4 x

Qi = [0 4 -9];
Qf = [0 4 -6];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts)
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts)
disp(' -----------------------------------------')

% --------------------------------------------------------------------- 
% 2 1 x

Qi = [2 1 -9];
Qf = [2 1 -6];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts)
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts)
disp(' -----------------------------------------')

% --------------------------------------------------------------------- 
% -5 -3 x

Qi = [-5 -3 -2];
Qf = [-5 -3  2];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts)
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts)
disp(' -----------------------------------------')

% --------------------------------------------------------------------- 
% x 0 -8

Qi = [1 0 -8];
Qf = [3 0 -8];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts)
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts)
disp(' -----------------------------------------')

% --------------------------------------------------------------------- 
% x 3 -9

Qi = [-1 3 -9];
Qf = [ 1 3 -9];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts)
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts)
disp(' -----------------------------------------')

% --------------------------------------------------------------------- 
% x -1 -8

Qi = [-2 -1 -8];
Qf = [ 2 -1 -8];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts)
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts)
disp(' -----------------------------------------')

% --------------------------------------------------------------------- 
% x -2 -6

Qi = [-1 -2 -6];
Qf = [ 1 -2 -6];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts)
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts)
disp(' -----------------------------------------')

% --------------------------------------------------------------------- 
% x -3 -2

Qi = [-1 -3 -2];
Qf = [ 1 -3 -2];
Qip = permute_Q(Qi);
Qfp = permute_Q(Qf);
auto_sqw(EXPtof_04_disordered,'Disordered',Qip,Qfp,Q_npts)
auto_sqw(EXPtof_04_ordered,'Ordered',Qi,Qf,Q_npts)
disp(' -----------------------------------------')

% ---------------------------------------------------------------------

