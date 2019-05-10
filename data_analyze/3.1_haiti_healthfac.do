clear all 
use "/Users/emilyacker 1/Documents/contraceptives/data_clean/5.1_haiti_new_vars/5.1_haiti_new_vars.dta"

rename v467d med_distance
rename v467f med_alone

drop if visit_healthfac ==9

//OLS regression
eststo: reg visit_healthfac age urban region educ_years i.wealth_ruralwt work children visitfw breastfeed med_permiss med_money med_distance med_alone work control_sum emotional_total less_violence severe_violence sexual_violence [pweight= dom_violencewt], cluster (cluster_num)

//Logit regression
eststo: logit visit_healthfac age urban region educ_years i.wealth_ruralwt work children visitfw breastfeed med_permiss med_money med_distance med_alone work control_sum emotional_total less_violence severe_violence sexual_violence [pweight= dom_violencewt], cluster (cluster_num)

//Probit regression
eststo: probit visit_healthfac age urban region educ_years i.wealth_ruralwt work children visitfw breastfeed med_permiss med_money med_distance med_alone work control_sum emotional_total less_violence severe_violence sexual_violence [pweight= dom_violencewt], cluster (cluster_num)

//Logit regression without DV
eststo: logit visit_healthfac age urban region educ_years i.wealth_ruralwt work children visitfw breastfeed med_permiss med_money med_distance med_alone [pweight= dom_violencewt], cluster (cluster_num)


//OLS regression indwt
//eststo: reg visit_healthfac age urban i.region educ_years wealth_score_ruralwt children visitfw breastfeed med_permiss med_money work control_sum emotional_total less_violence severe_violence sexual_violence [pweight= ind_samplewt], cluster (cluster_num)

//Logit regression indwt
//eststo: logit visit_healthfac age urban i.region educ_years wealth_score_ruralwt children visitfw breastfeed med_permiss med_money work control_sum emotional_total less_violence severe_violence sexual_violence [pweight= ind_samplewt], cluster (cluster_num)

//Probit regression indwt
//eststo: probit visit_healthfac age urban i.region educ_years wealth_score_ruralwt children visitfw breastfeed med_permiss med_money work control_sum emotional_total less_violence severe_violence sexual_violence [pweight= ind_samplewt], cluster (cluster_num)

esttab, label
