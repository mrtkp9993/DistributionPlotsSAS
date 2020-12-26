data studentt_distribution;
	do x = -6 to 6 by 0.01;
		pdf1 = pdf('T', x, 2);
		pdf2 = pdf('T', x, 5);
		pdf3 = pdf('T', x, 60);
		output;
	end;
run;

/* figure 14.1 */
proc sgplot data=studentt_distribution;
	series x = x y = pdf1 / legendlabel="m = n = 5";
	series x = x y = pdf2 / legendlabel="m = n = 10" lineattrs=(pattern=dash);
	series x = x y = pdf3 / legendlabel="m = n = 20" lineattrs=(pattern=dot);
	yaxis label="probability";
run;