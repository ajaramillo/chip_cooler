% internal indices
II = [];
for j = 2:Nz-3
    II = [II, j*Nr + 3 : (j+1)*Nr - 2];
end

% north indices
IN = Nr*(Nz-2) + 3 : Nr*(Nz-1) - 2;

% west indices
IW = (2:Nz-3)*Nr + 2;

% east indices
IE = (3:Nz-2)*Nr - 1;

% south indices
ISF = Nr + 3 : Nr + 1 + floor(1/dr);
IS0 = Nr + 1 + floor(1/dr) + 1 : 2*Nr - 2;

% corners
ISW = Nr + 2;
ISE = 2*Nr - 1;
INW = Nr*(Nz-2) + 2;
INE = Nr*(Nz-1)-1; 

% matrix assembly

M = sparse( [II II II II II,...
            IN IN IN IN,...
            IW IW IW IW,...
            IE IE IE IE,...
            ISF ISF ISF ISF,...
            IS0 IS0 IS0 IS0,...
            ISW ISW ISW,...
            ISE ISE ISE,...
            INW INW INW,...
            INE INE INE],...
            ...
            [II II+1 II-1 II+Nr II-Nr,...
            IN IN+1 IN-1 IN-Nr,...
            IW IW+1 IW+Nr IW-Nr,...
            IE IE-1 IE+Nr IE-Nr,...
            ISF ISF+1 ISF-1 ISF+Nr,...
            IS0 IS0+1 IS0-1 IS0+Nr,...
            ISW ISW+1 ISW+Nr,...
            ISE ISE-1 ISE+Nr,...
            INW INW+1 INW-Nr,...
            INE INE-1 INE-Nr],...
            ...
            [-2/dr^2-2/dz^2+II*0, 1/dr^2+II*0, 1/dr^2+II*0, 1/dz^2+II*0, 1/dz^2+II*0,...
            
            ], (Nr-1)*(Nz-1), (Nr-2)*(Nz-2));