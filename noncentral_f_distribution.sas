data noncentral_f_distribution;
	do x = 0 to 8 by 0.01;
		pdf1 = pdf('F', x, 10, 10, 1);
		pdf2 = pdf('F', x, 10, 10, 3);
		pdf3 = pdf('F', x, 10, 10, 6);
		output;
	end;
run;

/* figure 19.1 */
ods graphics on;
title 'Noncentral F-distribution';
proc sgplot data=noncentral_f_distribution;
	series x = x y = pdf1 / legendlabel="(*ESC*){unicode delta}=1";
	series x = x y = pdf2 / legendlabel="(*ESC*){unicode delta}=3" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="(*ESC*){unicode delta}=6" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
	xaxis label="m = n = 10";
run;
title;
ods graphics off;

data noncentral_f_distribution2;
	do x = 0 to 8 by 0.01;
		pdf1 = pdf('F', x, 5, 40, 1);
		pdf2 = pdf('F', x, 5, 40, 3);
		pdf3 = pdf('F', x, 5, 40, 6);
		output;
	end;
run;

/* figure 19.1 */
ods graphics on;
title 'Noncentral F-distribution';
proc sgplot data=noncentral_f_distribution2;
	series x = x y = pdf1 / legendlabel="(*ESC*){unicode delta}=1";
	series x = x y = pdf2 / legendlabel="(*ESC*){unicode delta}=3" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="(*ESC*){unicode delta}=6" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
	xaxis label="m = 5, n = 40";
run;
title;
ods graphics off;

data noncentral_f_distribution3;
	do x = 0 to 8 by 0.01;
		pdf1 = pdf('F', x, 40, 5, 1);
		pdf2 = pdf('F', x, 40, 5, 3);
		pdf3 = pdf('F', x, 40, 5, 6);
		output;
	end;
run;

/* figure 19.1 */
ods graphics on;
title 'Noncentral F-distribution';
proc sgplot data=noncentral_f_distribution3;
	series x = x y = pdf1 / legendlabel="(*ESC*){unicode delta}=1";
	series x = x y = pdf2 / legendlabel="(*ESC*){unicode delta}=3" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="(*ESC*){unicode delta}=6" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
	xaxis label="m = 40, n = 5";
run;
title;
ods graphics off;
