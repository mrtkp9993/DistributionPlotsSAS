data discrete_uniform;
	do x = 1 to 10 by 1;
		pmf = pmf('uniform', x, 1, 10);
		output;
	end;
run;

/* Figure 3.1 */
ods graphics on;
title 'Discrete Uniform Distribution';
proc sgplot data=discrete_uniform;
  series x = x y = pmf / lineattrs = (color = black);
  xaxis grid minorgrid min=1 max=10;
  yaxis grid min=0 max=0.2;
run;
ods graphics off;
