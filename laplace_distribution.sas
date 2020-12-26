data laplace_distribution;
	do x = -8 to 8 by 0.01;
		pdf1 = pdf('laplace', x, 0, 1);
		pdf2 = pdf('laplace', x, 0, 1.5);
		pdf3 = pdf('laplace', x, 0, 3);
		output;
	end;
run;

/* figure 21.1 */
ods graphics on;
title 'Laplace distribution';
proc sgplot data=laplace_distribution;
	series x = x y = pdf1 / legendlabel="b = 1";
	series x = x y = pdf2 / legendlabel="b = 1.5" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="b = 3" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
yaxis label="probability";
run;
title;
ods graphics off;
