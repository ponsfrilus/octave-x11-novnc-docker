
w = linspace(0,1,20);
w = w';
x = w;

y = zeros(400,1);

for i=2:20
	x = [x; w];
end

for i=1:19
	y(i+(i-1)*20:i+(i-1)*20+19) = w(i);
end

z = 1 - x - y;

D = [x y z];

dlmwrite('plane.txt',D,"delimiter","  ");

plot3(x(1:100), y(1:100),z(1:100),'+r',x(101:200), y(101:200),z(101:200),'+c',x(201:300), y(201:300),z(201:300),'+g',x(301:400), y(301:400),z(301:400),'+b');
pause
