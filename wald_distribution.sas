data wald_dist;
	do x = 0 to 7 by 0.01;
		pdf1 = pdf('wald', x, 1, 1);
		pdf2 = pdf('wald', x, 2, 1);
		pdf3 = pdf('wald', x, 3, 1);
		output;
	end;
run;

/* figure 28.1 */
ods graphics on;
title 'Wald distribution';
proc sgplot data=wald_dist;
	series x = x y = pdf1 / legendlabel="(*ESC*){unicode lambda} = 1";
	series x = x y = pdf2 / legendlabel="(*ESC*){unicode lambda} = 2" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="(*ESC*){unicode lambda} = 3" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
	xaxis label="(*ESC*){unicode mu} = 1";
run;
title;
ods graphics off;
