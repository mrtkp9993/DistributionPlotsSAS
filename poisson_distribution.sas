data poisson_distribution;
	do x = 0 to 16 by 1;
		panel = "1. lambda = 5";
		pmf = pdf('poisson', x, 5);
		output;
	end;
	do x = 0 to 30 by 1;
		panel = "2. lambda = 10";
		pmf = pdf('poisson', x, 10);
		output;
	end;
	do x = 0 to 50 by 1;
		panel = "3. lambda = 5";
		pmf = pdf('poisson', x, 20);
		output;
	end;
	do x = 0 to 60 by 1;
		panel = "4. lambda = 5";
		pmf = pdf('poisson', x, 30);
		output;
	end;
run;

proc sort data=poisson_distribution;
	by panel;
run;

proc format;
	value panelfmt 1=
				   2=
				   3=
				   4=;
run;

/* Figure 6.1 */
ods graphics on;
proc sgpanel data=poisson_distribution;
	panelby panel / novarname columns=2 rows=2;
	needle x = x y = pmf / baselineattrs=(thickness=0);
	colaxis grid;
	rowaxis grid;
	format panel panelfmt.;
	title "Poisson probability mass function";
run;
ods graphics off;
