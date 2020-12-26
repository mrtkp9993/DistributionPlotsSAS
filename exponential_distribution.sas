data exp_distribution;
	do x = 0 to 10 by 0.01;
		pdf1 = pdf('exponential', x, 1);
		pdf2 = pdf('exponential', x, 2);
		pdf3 = pdf('exponentialT', x, 3);
		output;
	end;
run;

/* figure 15.1 */
ods graphics on;
title 'Exponential distribution';
proc sgplot data=exp_distribution;
	series x = x y = pdf1 / legendlabel="b = 1";
	series x = x y = pdf2 / legendlabel="b = 2" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="b = 3" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
run;
title;
ods graphics off;
