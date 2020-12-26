data neg_binomial_distribution;
	do x = 0 to 40 by 1;
		panel = 1;
		pmf = pdf('negbinomial', x, 0.1, 2);
		output;
	end;
	do x = 0 to 35 by 1;
		panel = 2;
		pmf = pdf('negbinomial', x, 0.25, 5);
		output;
	end;
	do x = 0 to 25 by 1;
		panel = 3;
		pmf = pdf('negbinomial', x, 0.5, 10);
		output;
	end;
	do x = 0 to 20 by 1;
		panel = 4;
		pmf = pdf('negbinomial', x, 0.75, 15);
		output;
	end;
	do x = 0 to 40 by 1;
		panel = 5;
		pmf = pdf('negbinomial', x, 0.5, 20);
		output;
	end;
	do x = 0 to 16 by 1;
		panel = 6;
		pmf = pdf('negbinomial', x, 0.9, 20);
		output;
	end;
run;

proc sort data=neg_binomial_distribution;
	by panel;
run;

proc format;
	value panelfmt 1="r = 2, p = 0.1"
				   2="r = 5, p = 0.25"
				   3="r = 10, p = 0.5"
				   4="r = 15, p = 0.75"
				   5="r = 20, p = 0.5"
				   6="r = 20, p = 0.9";
run;

/* Figure 8.1 */
ods graphics on;
proc sgpanel data=neg_binomial_distribution;
	panelby panel / uniscale=column novarname columns=2 rows=3;
	needle x = x y = pmf / baselineattrs=(thickness=0);
	colaxis grid;
	rowaxis grid;
	format panel panelfmt.;
run;
ods graphics off;
