data lognormal_distribution;
	do x = 0 to 6 by 0.01;
		pdf1 = pdf('lognormal', x, 0, 1);
		pdf2 = pdf('lognormal', x, 0, 1.5);
		pdf3 = pdf('lognormal', x, 0, 3);
		output;
	end;
run;

/* figure 23.1 */
ods graphics on;
title 'Log-normal distribution';
proc sgplot data=lognormal_distribution;
	series x = x y = pdf1 / legendlabel="(*ESC*){unicode sigma} = 1";
	series x = x y = pdf2 / legendlabel="(*ESC*){unicode sigma} = 1.5" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="(*ESC*){unicode sigma} = 3" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability" values=(0 to 3 by 0.5);
	xaxis label="mu = 0";
run;
title;
ods graphics off;
