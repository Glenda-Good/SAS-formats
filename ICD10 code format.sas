/*format to add periods to ICD10 codes
for display when they are stored without them
ex. Q250 ->Q25.0
April 13, 2018
Gwen LaSelva SAS 9.4 Windows 10*/

proc fcmp outlib=work.functions.smd;

   function icd10fmt(icd $) $;
      length icdp $8 icd $7;
	  icdp=catx('.',substr(icd,1,3),substr(icd,4));
      if length(icd) LE 3 then return(icd);
      else return(icdp);
   endsub;
run;
options cmplib=(work.functions);
proc format; value $icd10fmt other=[icd10fmt()]; run;
