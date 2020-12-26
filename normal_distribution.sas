data normal_distribution;
	do x = -10 to 10 by 0.01;
		pdf1 = pdf('normal', x, 0, 1);
		pdf2 = pdf('normal', x, 0, 2);
		pdf3 = pdf('normal', x, 0, 3);
		pdf4 = pdf('normal', x, 0, 4);
		output;
	end;
run;

/* figure 11.1 */
ods graphics on;
title 'Normal distribution';
proc sgplot data=normal_distribution;
	series x = x y = pdf1 / legendlabel="(*ESC*){unicode sigma} = 1";
	series x = x y = pdf2 / legendlabel="(*ESC*){unicode sigma} = 2" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="(*ESC*){unicode sigma} = 3" lineattrs=(pattern=dot);
	series x = x y = pdf4 / legendlabel="(*ESC*){unicode sigma} = 4" lineattrs=(pattern=dashdotdot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
run;
title;
ods graphics off;

data normal_distribution2;
	do x = -10 to 10 by 0.01;
		pdf1 = pdf('normal', x, -1, 1);
		pdf2 = pdf('normal', x, 0, 1);
		pdf3 = pdf('normal', x, 2, 1);
		output;
	end;
run;

/* figure 11.2 */
ods graphics on;
title 'Normal Distribution';
proc sgplot data=normal_distribution2;
	series x = x y = pdf1 / legendlabel="(*ESC*){unicode sigma} = -1";
	series x = x y = pdf2 / legendlabel="(*ESC*){unicode sigma} = 0" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="(*ESC*){unicode sigma} = 2" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
yaxis label="probability";
run;
title;
ods graphics off;
