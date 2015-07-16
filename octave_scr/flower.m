t=linspace(0,4*pi,400);

x = 2 .* sin(3.*t) .* cos(t);
y = 2 .* sin(3.*t) .* sin(t);
z = sin(3.*t);

D = [x; y; z];
dlmwrite('flower3D.txt',D',"delimiter","  ");

plot3(x,y,z,'-r');
pause

