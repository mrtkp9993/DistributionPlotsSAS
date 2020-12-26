data hypergeometric_distribution2;
	do x = 0 to 20 by 1;
		panel = 1;
		pmf = pdf('hyper', x, 100, 10, 20);
		output;
	end;
	do x = 0 to 20 by 1;
		panel = 2;
		pmf = pdf('hyper', x, 100, 25, 20);
		output;
	end;
	do x = 0 to 20 by 1;
		panel = 3;
		pmf = pdf('hyper', x, 100, 50, 20);
		output;
	end;
	do x = 0 to 20 by 1;
		panel = 4;
		pmf = pdf('hyper', x, 100, 75, 20);
		output;
	end;
	do x = 0 to 20 by 1;
		panel = 5;
		pmf = pdf('hyper', x, 5000, 500, 20);
		output;
	end;
	do x = 0 to 20 by 1;
		panel = 6;
		pmf = pdf('hyper', x, 5000, 1250, 20);
		output;
	end;
run;

proc sort data=hypergeometric_distribution;
	by panel;
run;

proc format;
	value panelfmt 1="N(*ESC*){unicode '003D'x}100,n(*ESC*){unicode '003D'x}20,p(*ESC*){unicode '003D'x}0.1"
				2="N(*ESC*){unicode '003D'x}100,n(*ESC*){unicode '003D'x}20,p(*ESC*){unicode '003D'x}0.25"
				3="N(*ESC*){unicode '003D'x}100,n(*ESC*){unicode '003D'x}20,p(*ESC*){unicode '003D'x}0.5"
				4="N(*ESC*){unicode '003D'x}100,n(*ESC*){unicode '003D'x}20,p(*ESC*){unicode '003D'x}0.75"
				5="N(*ESC*){unicode '003D'x}5000,n(*ESC*){unicode '003D'x}20,p(*ESC*){unicode '003D'x}0.1"
				6="N(*ESC*){unicode '003D'x}5000,n(*ESC*){unicode '003D'x}20,p(*ESC*){unicode '003D'x}0.25";
run;

/* Figure 5.1 */
ods graphics on;
proc sgpanel data=hypergeometric_distribution;
	panelby panel / novarname columns=2 rows=3;
	needle x = x y = pmf / baselineattrs=(thickness=0);
	colaxis grid;
	rowaxis grid;
	format panel panelfmt.;
run;
ods graphics off;

data hypergeometric_distribution2;
	do x = 0 to 20 by 1;
		panel = 1;
		pmf = pdf('hyper', x, 5000, 2500, 20);
		output;
	end;
	do x = 0 to 20 by 1;
		panel = 2;
		pmf = pdf('hyper', x, 5000, 3750, 20);
		output;
	end;
	do x = 0 to 100 by 1;
		panel = 3;
		pmf = pdf('hyper', x, 5000, 500, 100);
		output;
	end;
	do x = 0 to 100 by 1;
		panel = 4;
		pmf = pdf('hyper', x, 5000, 1250, 100);
		output;
	end;
	do x = 0 to 100 by 1;
		panel = 5;
		pmf = pdf('hyper', x, 5000, 3750, 100);
		output;
	end;
	do x = 0 to 100 by 1;
		panel = 6 ;
		pmf = pdf('hyper', x, 5000, 4500, 100);
		output;
	end;
run;

proc sort data=hypergeometric_distribution2;
	by panel;
run;

proc format;
	value panel2fmt 1="N(*ESC*){unicode '003D'x}5000,n(*ESC*){unicode '003D'x}20,p(*ESC*){unicode '003D'x}0.5"
				2="N(*ESC*){unicode '003D'x}5000,n(*ESC*){unicode '003D'x}20,p(*ESC*){unicode '003D'x}0.75"
				3="N(*ESC*){unicode '003D'x}5000,n(*ESC*){unicode '003D'x}100,p(*ESC*){unicode '003D'x}0.1"
				4="N(*ESC*){unicode '003D'x}5000,n(*ESC*){unicode '003D'x}100,p(*ESC*){unicode '003D'x}0.25"
				5="N(*ESC*){unicode '003D'x}5000,n(*ESC*){unicode '003D'x}100,p(*ESC*){unicode '003D'x}0.75"
				6="N(*ESC*){unicode '003D'x}5000,n(*ESC*){unicode '003D'x}100,p(*ESC*){unicode '003D'x}0.9";
run;

/* Figure 5.1 continued */
ods graphics on;
proc sgpanel data=hypergeometric_distribution2;
	panelby panel / uniscale=column novarname columns=2 rows=3;
	needle x = x y = pmf / baselineattrs=(thickness=0);
	colaxis grid;
	rowaxis grid;
		format panel panel2fmt.;
run;
ods graphics off;
