clear
use "/Users/emilyacker 1/Documents/contraceptives/data_clean/5.1_haiti_new_vars/5.1_haiti_new_vars.dta"

tab method_current

//reasons women aren't use contraceptives
keep reasona-reasonz
ssc install fre
fre reasona-reasonz
