% "Visualizing the Lorenz Strange Attractor with Octave"
% http://www.ibm.com/developerworks/library/l-datavistools/  (Listing 4)
% 
% Big Thanks to Douglas (http://lists.gnu.org/archive/html/help-octave/2015-07/msg00159.html)


% Usage:
%	x = lsode("lorenz", [3;15;1], (0:0.01:25)');
%	plot3(x(:,1),x(:,2),x(:,3))
%	plot3(x(:,001),x(:,3),x(:,2))

function y = lorenz( x, t )
	y = [10 * (x(2) - x(1));
	x(1) * (28 - x(3));
	x(1) * x(2) - 8/3 * x(3)];
endfunction

