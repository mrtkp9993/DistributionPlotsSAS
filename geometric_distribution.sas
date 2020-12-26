data geometric_distribution;
	do x=0 to 20 by 1;
		panel=1;
		pmf=pdf('geometric', x-1, 0.2);
		output;
	end;
	do x=0 to 20 by 1;
		panel=2;
		pmf=pdf('geometric', x-1, 0.5);
		output;
	end;
	do x=0 to 20 by 1;
		panel=3;
		pmf=pdf('geometric', x-1, 0.9);
		output;
	end;
run;

proc format;
	value panel 1='p = 0.2'
				2='p = 0.5'
				3='p = 0.9';
run;

proc sort data=geometric_distribution;
	by panel;
run;

/* kitapta yok */
ods graphics on;
proc sgpanel data=geometric_distribution;
	format panel panel.;
	panelby panel / novarname columns=1 rows=3;
	needle x = x y = pmf / baselineattrs=(thickness=0);
	colaxis grid;
	rowaxis grid;
	title "Poisson probability mass function";
run;
ods graphics off;
