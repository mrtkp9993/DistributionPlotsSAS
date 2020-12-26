data gamma_distribution;
	do x = 0 to 50 by 0.01;
		pdf1 = pdf('gamma', x, 1);
		pdf2 = pdf('gamma', x, 5);
		pdf3 = pdf('gamma', x, 10);
		pdf4 = pdf('gamma', x, 30);
		output;
	end;
run;

/* figure 16.1 */
ods graphics on;
title 'Gamma distribution';
proc sgplot data=gamma_distribution;
	series x = x y = pdf1 / legendlabel="a = 1";
	series x = x y = pdf2 / legendlabel="a = 5" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="a = 10" lineattrs=(pattern=dot);
	series x = x y = pdf4 / legendlabel="a = 30" lineattrs=(pattern=dashdotdot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
run;
title;
ods graphics off;
