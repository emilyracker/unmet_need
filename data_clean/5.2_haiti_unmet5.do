clear all
use "/Users/emilyacker 1/Documents/contraceptives/data_clean/4.1_haiti_clean/4.1_haiti_clean.dta"


gen urban=1 if ruralstr==1
replace urban=0 if urban==.
codebook unmet3
//generate new definition of unmet need 
// 0 = using for spacing OR using for limiting
// 1 = unmet need for limiting OR unmet need for spacing; 
codebook unmet3
gen unmet5 = unmet3
recode unmet5 (2=1)
recode unmet5 (3=0)
recode unmet5 (4=0)
drop if unmet5>1
tab unmet5
//generate age2 variable 
gen age2=(age^2)
