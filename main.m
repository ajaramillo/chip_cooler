%% mesh deltas
Nz = 10;
Nr = 40;

%% basic scales
R = 10e-3;      % [m]
Q = 30;         % [W]
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
dz = Lz / (Nz - 1);
dr = Lr / (Nr - 1);

%% indices setting
SET_INDICES

%% assembly matrix & rhs
ASSEMBLY_SYSTEM

%% solving the system
III = [II IN IE IW ISF IS0 ISW ISE INE INW];
T = M(III,III) \ b(III);

%% computational mesh
rr = linspace(0, Lr, Nr);
zz = linspace(0, Lz, Nz);

[ZZ,RR] = meshgrid(zz,rr);

%% plotting solution
plot_mesh

shading 'interp'