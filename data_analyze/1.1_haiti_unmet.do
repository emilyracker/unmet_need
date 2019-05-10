clear all
use "/Users/emilyacker 1/Documents/contraceptives/data_clean/5.1_haiti_new_vars/5.1_haiti_new_vars.dta"

//This is a multinomial logit analysis that is similar to 1.2, except it looks at different categories of women
//Determining who has an unmet need for contraceptives
//unmet4 codebook: 
// 1 = unmet need for limiting OR unmet need for spacing; 
// 2 = using for spacing OR using for limiting OR no unmet need; 
// 3 = never had sex OR unmarried and no sex in last 30 days;
// 4 = infecund, menopausal 

//round one, demographic factors
corr age age2 age_firstchild urban literacy educ_years religion
mlogit unmet4 age age2 age_firstchild i.region urban i.religion literacy educ_years i.yr_int /*
*/ [pweight= ind_samplewt], rrr
 
//round two, demographic factors + wealth - region 
corr age age2 urban literacy educ_years wealth_score_ruralwt work
mlogit unmet4 age age2 age_firstchild urban i.religion literacy educ_years i.yr_int /*
*/i.wealth_ruralwt work /*
*/ [pweight= ind_samplewt], rrr

//round three, demographic factors + wealth + access - region 
corr age age2 age_firstchild urban literacy educ_years wealth_score_ruralwt work visitfw visit_healthfac
mlogit unmet4 age age2 age_firstchild urban i.religion literacy educ_years i.yr_int /*
*/i.wealth_ruralwt work /*
*/visitfw visit_healthfac/*
*/[pweight= ind_samplewt], rrr

//round four, demographic factors + wealth + access + empowerment - region 
corr age age2 age_firstchild urban literacy educ_years wealth_score_ruralwt work visitfw visit_healthfac cond_ask control_sum emotional_total less_violence severe_violence sexual_violence
eststo: mlogit unmet4 age age2 age_firstchild urban i.religion literacy educ_years i.yr_int ///
i.wealth_ruralwt work ///
visitfw visit_healthfac ///
cond_ask i.control_sum emotional_total less_violence severe_violence sexual_violence ///
[pweight= ind_samplewt], rrr

esttab
///should i use ind weight or dom violence wt? 
