% Visualizing the Lorentz Strange Attractor with Octave

function y = lorenz (x, t)
  y = [10 * (x(2) - x(1));
  x(1) * (28 - x(3));
  x(1) * x(2) - 8/3 * x(3)];
endfunction

x = lsode("lorenz", [3;15;1], (0:0.01:25)');
gset parametric
gsplot x
