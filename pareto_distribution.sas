data pareto_distribution;
	do x = 1 to 5.5 by 0.01;
		pdf1 = pdf('pareto', x, 1, 1);
		pdf2 = pdf('pareto', x, 2, 1);
		pdf3 = pdf('pareto', x, 3, 1);
		output;
	end;
run;

/* figure 24.1 */
ods graphics on;
title 'Pareto distribution';
proc sgplot data=pareto_distribution;
	series x = x y = pdf1 / legendlabel="(*ESC*){unicode lambda} = 1";
	series x = x y = pdf2 / legendlabel="(*ESC*){unicode lambda}  = 2" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="(*ESC*){unicode lambda}  = 3" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability" values=(0 to 3 by 0.5);
	xaxis label="(*ESC*){unicode sigma} = 1";
run;
title;
ods graphics off;
