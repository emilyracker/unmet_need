clear all
use "/Users/emilyacker 1/Documents/contraceptives/data_clean/4.1_haiti_clean/4.1_haiti_clean.dta"


gen urban=1 if ruralstr==1
replace urban=0 if urban==.
codebook unmet3
//generate new definition of unmet need 
// 1 = unmet need for limiting OR unmet need for spacing; 
// 2 = using for spacing OR using for limiting OR no unmet need; 
// 3 = never had sex OR unmarried and no sex in last 30 days;
// 4 = infecund, menopausal 
gen unmet4 = unmet3
recode unmet4 (2=1)
recode unmet4 (3=2)
recode unmet4 (4=2)
recode unmet4 (7=2)
recode unmet4 (0=3)
recode unmet4 (8=3)
recode unmet4 (9=4)
drop if unmet4==99
tab unmet4
//generate age2 variable 
gen age2=(age^2)

