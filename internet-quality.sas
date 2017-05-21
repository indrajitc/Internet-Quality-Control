/*Stat Quality Control HW 4*/
libname hw4 'C:\Users\Owner\Documents\Grad School\MS Statistics\Spring 2017\Stat Quality Control\HW\HW 4';
PROC IMPORT OUT= hw4.internet
			DATAFILE= "C:\Users\Owner\Documents\Grad School\MS Statistics\Spring 2017\Stat Quality Control\HW\HW 4\internetdata.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
RUN;
PROC SORT DATA = hw4.internet out = hw4.internet_sorted;
by Day;
run;
PROC SHEWHART DATA = hw4.internet_sorted;
	xrchart Download_Speed * Day /
		zones
		zonelabels
		tests = 1 to 8
		rtmplot = histogram;
run;
