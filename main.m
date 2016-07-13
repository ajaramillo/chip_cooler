%% mesh deltas
Nz = 10;
Nr = 49/2;

%% basic scales
R = 10e-3;      % [m]          , width of the contact source
Q = 30;         % [W]          , amplitude of the heat source
kappa = 209;    % [W m^-1 K^-1], thermal diffusivity
Tinf = 328.15;  % [K]          , tempeture at infinity

L = 49e-3;      % [m]
H = 4e-3;       % [m]

HF = 30e-3;     % [m]          , height of fins
HW = 4e-3;      % [m]          , width of fins

h = 8;          % [W/K]        , thermal transmition through the boundary

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

%% computational mesh
rr = linspace(0, Lr, Nr);
zz = linspace(0, Lz, Nz);

[ZZ,RR] = meshgrid(zz,rr);

%% indices setting
SET_INDICES

%% assembly matrix & rhs
ASSEMBLY_SYSTEM

%% solving the system
III = [II IN IE IW ISF IS0 ISW ISE INE INW];
T = M(III,III) \ b(III);

TT = RR*0; 
TT(III) = T; % unknowns

%% set boundary values
SET_BOUNDARY

%% plotting solution
plot_mesh