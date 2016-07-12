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