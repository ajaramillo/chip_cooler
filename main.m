%% basic scales

R = 10e-3;      % [m]
Q = 15;         % [W]
kappa = 209;    % [W m^-1 K^-1]
Tinf = 328.15;  % [K]

L = 49e-3;      % [m]
H = 4e-3;       % [m]

h = 8;          % [W/K]

%% non-dimensional numbers

% transport properties
k1 = Q*R/kappa/Tinf;
k2 = R*h/kappa;

% domain dimensions
Lr = L/R;
Lz = H/R;

%% numeric variables

Nz = 6;  dz = Lz / (Nz - 1);
Nr = 5; dr = Lr / (Nr - 1);

%% indices setting

SET_INDICES
