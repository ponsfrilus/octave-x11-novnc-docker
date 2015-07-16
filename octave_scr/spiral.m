t=linspace(0,7*pi,400);

x = t;
y = t.*cos(t);
z = t.*sin(t);

D = [x; y; z];
dlmwrite('spiral3D.txt',D',"delimiter","  ");

plot3(x,y,z,'+r');
pause

