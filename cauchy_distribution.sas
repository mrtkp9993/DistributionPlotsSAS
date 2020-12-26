data cauchy_dist;
	do x = -10 to 10 by 0.01;
		pdf1 = pdf('cauchy', x, 0, 1);
		pdf2 = pdf('cauchy', x, 0, 2);
		pdf3 = pdf('cauchy', x, 0, 3);
		output;
	end;
run;

/* figure 27.1 */
ods graphics on;
title 'Cauchy Distribution';
proc sgplot data=cauchy_dist;
	series x = x y = pdf1 / legendlabel="b = 1";
	series x = x y = pdf2 / legendlabel="b = 2" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="b = 3" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
	xaxis label="a = 0";
run;
title;
ods graphics off;
