proc fcmp outlib=work.funcs.pdf;
	function inv_gauss_pdf(x, mu, lambda);
		prob = ((lambda / (2 * constant('pi') * x**3))**(1/2)) * exp((-lambda * (x-mu) ** 2)/(2*mu**2*x));
		return(prob);
	endsub;
options cmplib=work.funcs;
data ig_distribution;
	do x = 0.01 to 7 by 0.01;
		pdf1 = inv_gauss_pdf(x, 1, 1);
		pdf2 = inv_gauss_pdf(x, 1, 2);
		pdf3 = inv_gauss_pdf(x, 1, 3);
		output;
	end;
run;

/* figure 28.1 */
ods graphics on;
title 'Inverse Gamma distribution';
proc sgplot data=ig_distribution;
	series x = x y = pdf1 / legendlabel="(*ESC*){unicode mu} = 1, (*ESC*){unicode lambda} = 1";
	series x = x y = pdf2 / legendlabel="(*ESC*){unicode mu} = 1, (*ESC*){unicode lambda} = 2" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="(*ESC*){unicode mu} = 1, (*ESC*){unicode lambda} = 3" lineattrs=(pattern=dot);
	keylegend / location=inside position=topright across=1;
yaxis label="probability";
run;
title;
ods graphics off;
