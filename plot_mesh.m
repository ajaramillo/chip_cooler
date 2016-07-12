TT = RR*0; 
TT(III) = T; % unknowns

% INW -- ..  -- IN  -- INE
% IW  -- ..  -- II  -- IE
% ISW -- ISF -- IS0 -- ISE

TT(IN+Nr) = (TT(IN) - k2*dz) / (1-k2*dz); % robin condition
TT(IW-1) = TT(IW); % 0 flux conditions
TT(IE+1) = TT(IE); % 0 flux conditions

TT(IS0-Nr) = TT(IS0);           % 0 flux conditions
TT(ISF-Nr) = TT(ISF) - dz*k1;   % feeding condition

TT(ISW-Nr) = TT(ISW) - dz*k1;               % feeding condition
TT(ISE-Nr) = TT(ISE);                       % 0 flux condition
TT(INE+Nr) = (TT(INE) - k2*dz) / (1-k2*dz); % robin condition
TT(INW+Nr) = (TT(INW) - k2*dz) / (1-k2*dz); % robin condition

TT(INE+1) = TT(INE); % 0 flux conditions
TT(INW-1) = TT(INW); % 0 flux conditions
TT(ISW-1) = TT(ISW);
TT(ISE+1) = TT(ISE);

% corners
TT(INE+1+Nr) = TT(INE+1);
TT(INW-1+Nr) = TT(INW-1);
TT(ISW-1-Nr) = TT(ISW-1);
TT(ISE+1-Nr) = TT(ISE+1);

% plot

pcolor(RR,ZZ,TT)
