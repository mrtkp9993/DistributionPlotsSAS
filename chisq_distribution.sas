data chisq_distribution;
	do x = 0 to 80 by 0.01;
		pdf1 = pdf('chisquare', x, 5);
		pdf2 = pdf('chisquare', x, 10);
		pdf3 = pdf('chisquare', x, 20);
		pdf4 = pdf('chisquare', x, 30);
		pdf5 = pdf('chisquare', x, 50);	
		output;
	end;
run;

/* figure 12.1 */
ods graphics on;
title 'Chisquared Distribution';
proc sgplot data=chisq_distribution;
	series x = x y = pdf1 / legendlabel="n = 5";
	series x = x y = pdf2 / legendlabel="n = 10" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="n = 20" lineattrs=(pattern=dot);
	series x = x y = pdf4 / legendlabel="n = 30" lineattrs=(pattern=dashdotdot);
	series x = x y = pdf5 / legendlabel="n = 50" lineattrs=(pattern=dashdashdot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
run;
title;
ods graphics off;
