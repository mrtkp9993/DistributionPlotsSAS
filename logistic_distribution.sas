data logistic_distribution;
	do x = -10 to 10 by 0.01;
		pdf1 = pdf('logistic', x, 0, 1);
		pdf2 = pdf('logistic', x, 0, 1.5);
		pdf3 = pdf('logistic', x, 0, 2);
		output;
	end;
run;

/* figure 22.1 */
ods graphics on;
title 'Logistic distribution';
proc sgplot data=logistic_distribution;
	series x = x y = pdf1 / legendlabel="b = 1";
	series x = x y = pdf2 / legendlabel="b = 1.5" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="b = 2" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
yaxis label="probability, a=0";
run;
title;
ods graphics off;
