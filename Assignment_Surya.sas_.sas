/* Generated Code (IMPORT) */
/* Source File: SAMPLE_DS.csv */
/* Source Path: /home/u61636704/sasuser.v94 */
/* Code generated on: 6/5/22, 10:23 PM */

PROC IMPORT DATAFILE = "/home/u61636704/sasuser.v94/SAMPLE_DS.csv"
DBMS = CSV OUT = WORK.DATA1 REPLACE;
RUN;


PROC IMPORT DATAFILE = "/home/u61636704/sasuser.v94/SAMPLE_DS.csv"
DBMS= CSV OUT= DATA1;
RUN;


DATA WORK.ANOVA_TEST;
	INPUT MARITAL_STATUS $ LOAN_AMOUNT;
	DATALINES;
A 3
A 4
A 5
B 7
B 8
B 9
;
RUN;

Title;
ods noproctitle;
ods graphics / imagemap=on;

proc glm data=WORK.ANOVA_TEST;
	Class MARITAL_STATUS;
	model LOAN_AMOUNT = MARITAL_STATUS;
	means MARITAL_STATUS / hovtest=levene welch plots=none;
	lsmeans MARITAL_STATUS / adjust=tukey pdiff alpha=.05;
	RUN;
QUIT;





# One Way Anova

Title;
ods noproctitle;
ods graphics / imagemap=on;

proc glm data=WORK.DATA1;
	Class MARITAL_STATUS;
	model LOAN_AMOUNT = MARITAL_STATUS;
	means MARITAL_STATUS / hovtest=levene welch plots=none;
	lsmeans MARITAL_STATUS / adjust=tukey pdiff alpha=.05;
	RUN;
QUIT;


	
	# P value less than 0.05 then we reject NULL Hypotheis.
	Here in this case, p value is 0.0003.
	Therefore, the NULL hypothesis is rejected which means that married and unmarried groups have different loan amounts.



PROC PRINT;
RUN;


DATA HELLO1;
SET DATA1;
IF LOAN_AMOUNT > 100 ;
RUN;


DATA HELLO2;
SET DATA1;
IF GENDER= '' THEN DELETE;
RUN;


DATA DATA1;
SET DATA1;
IF GENDER ='UNKNOWN' THEN GENDER ='Unknown';
RUN;


DATA DATA1;
SET DATA1;
IF GENDER ='UNKNOWN' THEN GENDER ='Unknown';
RUN;


DATA DATA1;
SET DATA1;
IF MARITAL_STATUS ='' THEN DELETE;
RUN;



DATA DATA1;
SET SASHELP.data1
IF LOAN_APPROVAL_STATUS = '' THEN DELETE;
RUN;


PROC SQL;
	title 'Gender Unknown';
	SELECT GENDER
		from SQL.DATA1;


PROC FREQ DATA= DATA1;
	TABLES GENDER /CHISQ;
RUN;


PROC FREQ DATA= DATA1;
	TABLES GENDER /CHISQ;
RUN;


-- Chi Square test to check independent variables

PROC FREQ DATA= DATA1;
	TABLES LOAN_APPROVAL_STATUS*MARITAL_STATUS /CHISQ;
RUN;


PROC FREQ DATA= DATA1;
	TABLES CANDIDATE_INCOME*LOAN_APPROVAL_STATUS  /CHISQ;
RUN;


-- Chi Square test to check independent variables (2)

PROC FREQ DATA= DATA1;
	TABLES GENDER*LOAN_APPROVAL_STATUS  /CHISQ;
RUN;


PROC SQL;
	UPDATE DATA1
	SET GENDER = 'UNKNOWN'
	WHERE GENDER IS NULL;
QUIT;	

	
PROC SQL;
	SELECT GENDER
	FROM DATA;
QUIT;


PROC FREQ DATA=SASHELP.
TABLES ORIGIN;
RUN;

PROC FREQ DATA = DATA1;
TABLE GENDER;
RUN;

PROC FREQ DATA = DATA1;
TABLES GENDER;
RUN;

PROC FREQ DATA= DATA1;
TABLE LOAN_LOCATION;
RUN;


PROC FREQ DATA= DATA1;
TABLE LOAN_LOCATION/ nocum;
RUN;


PROC FREQ DATA= DATA1;
TABLE LOAN_LOCATION*LOAN_APPROVAL_STATUS;
RUN;


PROC FREQ DATA= DATA1;
TABLE LOAN_LOCATION*LOAN_APPROVAL_STATUS/ NOCUM NOPERCENT NOROW NOCOL;
RUN;

PROC PRINT DATA= DATA1;
RUN;

* Descriptive Statistics;

PROC MEANS DATA=DATA1;
VAR CANDIDATE_INCOME GUARANTEE_INCOME LOAN_AMOUNT LOAN_DURATION;
RUN;

* Detailed Descriptive Statistics;
 
 PROC UNIVARIATE DATA=DATA1;
 VAR CANDIDATE_INCOME;
 RUN;
 
 
* CORRELATION;
 
 PROC CORR DATA=DATA1;
 VAR CANDIDATE_INCOME GUARANTEE_INCOME LOAN_AMOUNT LOAN_DURATION;
 RUN;
 
* PLOTTING THE DATA;

PROC GPLOT DATA=DATA1;
PLOT CANDIDATE_INCOME*LOAN_AMOUNT;
RUN;
 
* SIMPLE LINEAR REGRESSION;

PROC REG DATA=DATA1;
MODEL CANDIDATE_INCOME = LOAN_AMOUNT;
RUN;

* MULTIPLE LINEAR REGRESSION;

PROC REG DATA=DATA1;
MODEL CANDIDATE_INCOME = LOAN_AMOUNT GUARANTEE_INCOME LOAN_DURATION;
RUN;
 

* Simple Linear Regression ;

PROC REG data=data1;
MODEL CANDIDATE_INCOME * LOAN_AMOUNT;
RUN;





PROC FREQ DATA = SAMPLE_DS;
TABLES GENDER;
RUN;

PROC CONTENTS DATA=DATA1 OUT = DATA1_DETAILS;
RUN;



PROC SGPLOT DATA = DATA1;

HISTOGRAM LOAN_AMOUNT;

DENSITY LOAN_HISTORY;

RUN;


PROC SGPLOT DATA=DATA1;

	VBOX LOAN_AMOUNT /CATEGORY = GENDER;
	;RUN;
	
	
	
PROC SGSCATTER DATA = DATA1;
PLOT  LOAN_AMOUNT* CANDIDATE_INCOME/GROUP = GENDER GRID;
RUN;
	
	
	
PROC MEANS DATA=DATA1  CLM ALPHA=0.1;
DATA1 GENDER;
VAR CANDIDATE_INCOME;
INSET MEAN MEDIAN STD;
RUN;


PROC UNIVARIATE DATA=DATA1 ALPHA =0.1 MU0=185;
DATA1 GENDER;
VAR CANDIDATE_INCOME;
PPPLOT CANDIDATE_INCOME / NORMAL;
HISTOGRAM CANDIDATE_INCOME / NORMAL;
INSET MEAN MEDIAN STD SKEWNESS KURTOSIS;
RUN;


/* Check the missing Values */
proc means data=data1 nmiss;
run;


/* Descriptive Statistics of dataset */

proc means data=data1 mean median mode std var min max;
run;



/* Finding unique values in the data */

proc sql;
select count(distinct 'Gender'n) as 'Gender'n,
		count(distinct 'LOAN_LOCATION'n) as 'LOAN_LOCATION'n,
		count(distinct 'MARITAL_STATUS'n) as 'MARITAL_STATUS'n,
		count(distinct 'QUALIFICATION'n) as 'QUALIFICATION'n,
		count(distinct 'EMPLOYMENT'n) as 'EMPLOYMENT'n,
		count(distinct 'LOAN_APPROVAL_STATUS'n) as 'LOAN_APPROVAL_STATUS'n,
		count ( distinct LOAN_DURATION) as LOAN_DURATION,
		count ( distinct LOAN_HISTORY) as LOAN_HISTORY
		from data1;
	
	
	
/* Histogram */

/* Using multiple variables to create histogram */
proc univariate data=data1  novarcontents;
histogram 'CANDIDATE_INCOME'n 'LOAN_AMOUNT'n / ;
run;



/* Using single variable to create histogram */
ods graphics / reset width=6.4in height=4.8in imagemap;
proc sgplot data=data1;
	histogram 'CANDIDATE_INCOME'n /;
	yaxis grid;
run;
	
	
/* Check Relationship between two variables with scatter plot */
ods graphics / reset width=6.4in height=4.8in imagemap;
proc sgplot data=data1;
	scatter x='CANDIDATE_INCOME'n y='LOAN_AMOUNT'n /;
	xaxis grid;
	yaxis grid;
run;
ods graphics / reset;



/* Correlation among numeric variables */
ods noproctitle;
ods graphics / imagemap=on;
proc corr data=data1 pearson nosimple noprob plots=none;
	var 'CANDIDATE_INCOME'n 'GUARANTEE_INCOME'n 'LOAN_AMOUNT'n 
		'LOAN_DURATION'n 'LOAN_HISTORY'n ;
run;



/* Box plot to check outliers in the data */
ods graphics / reset width=6.4in height=4.8in imagemap;
proc sgplot data=data1;
	vbox 'CANDIDATE_INCOME'n  / category='EMPLOYMENT'n;
	yaxis grid;
run;
ods graphics / reset;


/* Box plot to check outliers in the data */
ods graphics / reset width=6.4in height=4.8in imagemap;
proc sgplot data=data1;
	vbox 'CANDIDATE_INCOME'n  / category='GENDER'n;
	yaxis grid;
run;
ods graphics / reset;


/*    */

PROC UNIVARIATE DATA=DATA1 ALPHA=0.1 MU0= = 185;
DATA1 GENDER;
VAR LOAN_DURATION;
PPPLOT LOAN_DURATION / normal;
HISTOGRAM  LOAN_DURATION / NORMAL;
INSET MEAN MEDIAN STD SKEWNESS KURTOSIS;
RUN;



proc contents data=blog.credit_train;
run;
