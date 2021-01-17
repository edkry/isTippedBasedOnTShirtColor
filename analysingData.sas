* Importing data files;
proc import datafile="/home/u49694286/Projektas1/tip.csv"
out=projekt.ket dbms=csv replace;
getnames=yes;
run;

* Checking the data file;
proc print data=projekt.ket;
run;

* Removing unnecessary variables and removing every observation where male = 0, which means we're going to analyze the data only where the customer is male.;
data projekt.ket;
set projekt.ket;
drop  sampsz;
if male = 0 then delete;
run;

* Checking if we have enough observations for each group.;
proc freq data=projekt.ket;
tables tipnum * color;
run;

* Creating the first logistic regression model and checking if every independent variable is statistically significant.;
proc logistic data=projekt.ket;
class black white green  blue yellow;
model tipnum(event="1") = black white green blue yellow;
run;

* Since yellow is statistically insignificant, I'm removing all the observations where waiter's or waitress' T-shirt is yellow.;
data projekt.ket1;
set projekt.ket;
if yellow = 1 then delete;
run;

* Creating logistic regression model and checking if every assumption is met.;
proc logistic data= projekt.ket1;
class black white green  blue;
model tipnum(event="1") =  black white green  blue /
iplots ctable cl;
run;
