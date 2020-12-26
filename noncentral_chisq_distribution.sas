data noncentral_chisq_distribution;
	do x = 0.1 to 50 by 0.01;
		pdf1 = pdf('chisquare', x, 1, 10);
		pdf2 = pdf('chisquare', x, 5, 10);
		pdf3 = pdf('chisquare', x, 10, 10);
		output;
	end;
run;

/* figure 18.1 */
ods graphics on;
title 'Noncentral Chisquared Distribution';
proc sgplot data=noncentral_chisq_distribution;
	series x = x y = pdf1 / legendlabel="n = 10, (*ESC*){unicode delta} = 1";
	series x = x y = pdf2 / legendlabel="n = 10, (*ESC*){unicode delta} = 2" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="n = 10, (*ESC*){unicode delta} = 5" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
run;
title;
ods graphics off;

data noncentral_chisq_distribution2;
	do x = 40 to 180 by 0.05;
		pdf1 = pdf('chisquare', x, 1, 100);
		pdf2 = pdf('chisquare', x, 5, 100);
		pdf3 = pdf('chisquare', x, 10, 100);
		output;
	end;
run;

/* figure 18.1 */
ods graphics on;
title 'Noncentral Chisquared Distribution';
proc sgplot data=noncentral_chisq_distribution2;
	series x = x y = pdf1 / legendlabel="n = 100, (*ESC*){unicode delta} = 1";
	series x = x y = pdf2 / legendlabel="n = 100, (*ESC*){unicode delta} = 2" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="n = 100, (*ESC*){unicode delta} = 5" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
run;
title;
ods graphics off;
