data weibull_distribution;
	do x = 0 to 6 by 0.01;
		pdf1 = pdf('weibull', x, 1, 1);
		pdf2 = pdf('weibull', x, 2, 1);
		pdf3 = pdf('weibull', x, 4, 1);
		output;
	end;
run;

/* figure 25.1 */
ods graphics on;
title 'Weibull distribution';
proc sgplot data=weibull_distribution;
	series x = x y = pdf1 / legendlabel="c = 1";
	series x = x y = pdf2 / legendlabel="c = 2" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="c = 4" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
	xaxis label="m = 0, b = 1";
run;
title;
ods graphics off;
