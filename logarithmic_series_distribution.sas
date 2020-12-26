proc fcmp outlib=work.funcs.pmf;
	function log_series_pmf(x, p);
		prob = (-1 / log(1-p)) * (p**x / x);
		return(prob);
	endsub;
options cmplib=work.funcs;
data log_series_dist;
	do x = 1 to 14 by 1;
		panel = 1;
		pmf = log_series_pmf(x, 0.1);
		output;
	end;
	do x = 1 to 14 by 1;
		panel = 2;
		pmf = log_series_pmf(x, 0.21);
		output;
	end;
	do x = 1 to 14 by 1;
		panel = 3;
		pmf = log_series_pmf(x, 0.4);
		output;
	end;
	do x = 1 to 14 by 1;
		panel = 4;
		pmf = log_series_pmf(x, 0.51);
		output;
	end;
	do x = 1 to 14 by 1;
		panel = 5;
		pmf = log_series_pmf(x, 0.7);
		output;
	end;
	do x = 1 to 14 by 1;
		panel = 6;
		pmf = log_series_pmf(x, 0.9);
		output;
	end;
run;

proc sort data=log_series_dist;
	by panel;
run;

proc format;
	value panelfmt 1="(*ESC*){unicode theta} = 0.1"
				   2="(*ESC*){unicode theta} = 0.2"
				   3="(*ESC*){unicode theta} = 0.4"
				   4="(*ESC*){unicode theta} = 0.5"
				   5="(*ESC*){unicode theta} = 0.7"
				   6="(*ESC*){unicode theta} = 0.9";
run;

/* Figure 9.1 */
ods graphics on;
proc sgpanel data=log_series_dist;
	panelby panel / uniscale=column novarname columns=2 rows=3;
	needle x = x y = pmf / baselineattrs=(thickness=0);
	colaxis grid;
	rowaxis grid;
	format panel panelfmt.;
run;
ods graphics off;
