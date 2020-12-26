data continuous_uniform;
	do x = 0 to 7 by 1;
		pdf = pdf('uniform', x, 2, 5);
		output;
	end;
run;

/* figure 10.1 */
ods graphics on;
title 'Uniform Distribution';
proc sgplot data=continuous_uniform;
	step x = x y = pdf;
run;
title;
ods graphics off;
