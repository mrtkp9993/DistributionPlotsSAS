data noncentral_studentt_distribution;
	do x = -10 to 10 by 0.01;
		pdf1 = pdf('T', x, 2, 0);
		pdf2 = pdf('T', x, 2, -4);
		pdf3 = pdf('T', x, 2, 4);
		output;
	end;
run;

/* figure 20.1 */
ods graphics on;
title 'Noncentral Student-t Distribution';
proc sgplot data=noncentral_studentt_distribution;
	series x = x y = pdf1 / legendlabel="(*ESC*){unicode delta} = 0";
	series x = x y = pdf2 / legendlabel="(*ESC*){unicode delta} = -4" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="(*ESC*){unicode delta} = 4" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability" values=(0 to 0.5 by 0.1);
run;
title;
ods graphics off;
