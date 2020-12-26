data f_distribution;
	do x = 0 to 6 by 0.01;
		pdf1 = pdf('F', x, 5, 5);
		pdf2 = pdf('F', x, 10, 10);
		pdf3 = pdf('F', x, 20, 20);
		pdf4 = pdf('F', x, 60, 60);
		output;
	end;
run;

/* figure 13.1 */
ods graphics on;
title "F distribution";
proc sgplot data=f_distribution;
	series x = x y = pdf1 / legendlabel="m = n = 5";
	series x = x y = pdf2 / legendlabel="m = n = 10" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="m = n = 20" lineattrs=(pattern=dot);
	series x = x y = pdf4 / legendlabel="m = n = 60" lineattrs=(pattern=dashdotdot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
run;
title;
ods graphics off;

data f_distribution2;
	do x = 0 to 4 by 0.01;
		pdf1 = pdf('F', x, 5, 10);
		pdf2 = pdf('F', x, 10, 5);
		pdf3 = pdf('F', x, 1, 10);
		pdf4 = pdf('F', x, 10, 1);
		output;
	end;
run;

ods graphics on;
title "F distribution";
proc sgplot data=f_distribution2;
	series x = x y = pdf1 / legendlabel="m = 5, n = 10";
	series x = x y = pdf2 / legendlabel="m = 10, n = 5" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="m = 1, n = 10" lineattrs=(pattern=dot);
	series x = x y = pdf4 / legendlabel="m = 10, n = 1" lineattrs=(pattern=dashdotdot);
	keylegend / location=inside position=topright across=1;
yaxis label="probability" values=(0 to 2.5 by 0.5);
run;
title;
ods graphics off;

