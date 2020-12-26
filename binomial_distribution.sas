data binomial_distribution;
	do x = 0 to 20 by 1;
		panel = 1;
		pmf = pdf('binomial', x, 0.1, 20);
		output;
	end;
	do x = 0 to 20 by 1;
		panel = 2;
		pmf = pdf('binomial', x, 0.25, 20);
		output;
	end;
	do x = 0 to 20 by 1;
		panel = 3;
		pmf = pdf('binomial', x, 0.5, 20);
		output;
	end;
	do x = 0 to 20 by 1;
		panel = 4;
		pmf = pdf('binomial', x, 0.75, 20);
		output;
	end;
	do x = 0 to 100 by 1;
		panel = 5;
		pmf = pdf('binomial', x, 0.1, 100);
		output;
	end;
	do x = 0 to 100 by 1;
		panel = 6;
		pmf = pdf('binomial', x, 0.25, 100);
		output;
	end;
	do x = 0 to 100 by 1;
		panel = 7;
		pmf = pdf('binomial', x, 0.75, 100);
		output;
	end;
	do x = 0 to 100 by 1;
		panel = 8;
		pmf = pdf('binomial', x, 0.9, 100);
		output;
	end;
run;

proc format;
 value panel 1 = 'n = 20, p = 0.1'
             2 = 'n = 20, p = 0.25'
             3 = 'n = 20, p = 0.5'
             4 = 'n = 20, p = 0.75'
             5 = 'n = 100, p = 0.1'
             6 = 'n = 100, p = 0.25'
             7 = 'n = 100, p = 0.75'
             8 = 'n = 100, p = 0.9';
run;

proc sort data=binomial_distribution;
	by panel;
run;

/* Figure 4.1 */
ods graphics on;
proc sgpanel data=binomial_distribution;
	format panel panel.;
	panelby panel / uniscale=column novarname columns=2 rows=4;
	needle x = x y = pmf / baselineattrs=(thickness=0);
	colaxis grid;
	rowaxis grid;
	title "Number of successes";
run;
ods graphics off;
