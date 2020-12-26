proc fcmp outlib=work.funcs.pdf;
	function extreme_val_pdf(x, mu, sigma);
		z = (x - mu) / sigma;
		prob = (1 / sigma) * exp(-z-exp(-z));
		return(prob);
	endsub;
options cmplib=work.funcs;
data ev_distribution;
	do x = -10 to 10 by 0.01;
		pdf1 = extreme_val_pdf(x, 0, 1);
		pdf2 = extreme_val_pdf(x, 0, 2);
		pdf3 = extreme_val_pdf(x, 0, 4);
		output;
	end;
run;

/* figure 26.1 */
ods graphics on;
title 'Extreme value distribution';
proc sgplot data=ev_distribution;
	series x = x y = pdf1 / legendlabel="(*ESC*){unicode mu} = 0, (*ESC*){unicode sigma} = 1";
	series x = x y = pdf2 / legendlabel="(*ESC*){unicode mu} = 0, (*ESC*){unicode sigma} = 2" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="(*ESC*){unicode mu} = 0, (*ESC*){unicode sigma} = 4" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
yaxis label="probability";
run;
title;
ods graphics off;
