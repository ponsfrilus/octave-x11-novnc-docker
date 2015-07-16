t=linspace(0,5*pi,400);

x = 5 .* cos(t) - cos(5.*t);
y = 5 .* sin(t) - sin(5.*t);
z = t;

D = [x; y; z];
dlmwrite('cloud3D.txt',D',"delimiter","  ");

plot3(x,y,z,'+b');
pause

