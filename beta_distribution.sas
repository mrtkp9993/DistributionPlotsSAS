data beta_distribution;
	do x = 0.1 to 0.98 by 0.01;
		pdf1 = pdf('beta', x, 0.5, 1);
		pdf2 = pdf('beta', x, 1, 0.5);
		pdf3 = pdf('beta', x, 0.5, 0.5);
		output;
	end;
run;

/* figure 17.1 */
ods graphics on;
title 'Beta Distribution';
proc sgplot data=beta_distribution;
	series x = x y = pdf1 / legendlabel="a = 0.5, b = 1";
	series x = x y = pdf2 / legendlabel="a = 1,   b = 0.5" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="a = 0.5, b = 0.5" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
run;
title;
ods graphics off;

data beta_distribution2;
	do x = 0.1 to 0.98 by 0.01;
		pdf1 = pdf('beta', x, 1, 2);
		pdf2 = pdf('beta', x, 2, 1);
		output;
	end;
run;
ods graphics on;
title 'Beta Distribution';
proc sgplot data=beta_distribution2;
	series x = x y = pdf1 / legendlabel="a = 1, b = 2";
	series x = x y = pdf2 / legendlabel="a = 2, b = 1" lineattrs=(pattern=dash);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
run;
title;
ods graphics off;

data beta_distribution3;
	do x = 0.1 to 0.98 by 0.01;
		pdf1 = pdf('beta', x, 2, 5);
		pdf2 = pdf('beta', x, 5, 2);
		pdf3 = pdf('beta', x, 10, 10);
		output;
	end;
run;

ods graphics on;
title 'Beta Distribution';
proc sgplot data=beta_distribution3;
	series x = x y = pdf1 / legendlabel="a = 2, b = 5";
	series x = x y = pdf2 / legendlabel="a = 5, b = 2" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="a = 10, b = 10" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
run;
title;
ods graphics off;

data beta_distribution4;
	do x = 0.1 to 0.98 by 0.01;
		pdf1 = pdf('beta', x, 4, 0.5);
		pdf2 = pdf('beta', x, 0.5, 4);
		output;
	end;
run;

ods graphics on;
title 'Beta Distribution';
proc sgplot data=beta_distribution4;
	series x = x y = pdf1 / legendlabel="a = 4, b = 0.5";
	series x = x y = pdf2 / legendlabel="a = 0.5, b = 4" lineattrs=(pattern=dash);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
run;
title;
ods graphics off;
