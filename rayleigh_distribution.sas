proc fcmp outlib=work.funcs.pdf;
	function rayleigh_pdf(x, b);
		prob = (x / b**2) * exp(-(x**2)/(2*b**2));
		return(prob);
	endsub;
options cmplib=work.funcs;
data ray_distribution;
	do x = 0.01 to 7 by 0.01;
		pdf1 = rayleigh_pdf(x, 1);
		pdf2 = rayleigh_pdf(x, 2);
		pdf3 = rayleigh_pdf(x, 3);
		output;
	end;
run;

/* figure 29.1 */
ods graphics on;
title 'Rayleigh distribution';
proc sgplot data=ray_distribution;
	series x = x y = pdf1 / legendlabel="(*ESC*){unicode mu} = 1, (*ESC*){unicode lambda} = 1";
	series x = x y = pdf2 / legendlabel="(*ESC*){unicode mu} = 1, (*ESC*){unicode lambda} = 2" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="(*ESC*){unicode mu} = 1, (*ESC*){unicode lambda} = 3" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
	yaxis label="probability";
run;
title;
ods graphics off;
