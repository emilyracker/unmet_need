clear all
use "/Users/emilyacker 1/Documents/contraceptives/data_clean/5.2_haiti_unmet5/5.2_haiti_unmet5.dta"
// This is similar to 1.1 except that it only looks at two categories of women and is a logit model

drop if religion==99

//Determining who has an unmet need for contraceptives
//unmet4 codebook: 
// 0 = using for spacing OR using for limiting 
// 1 = unmet need for limiting OR unmet need for spacing; 

sum unmet5

//round one, demographic factors
corr age age2 age_firstchild urban literacy educ_years religion
eststo:logistic unmet5 age age2 age_firstchild urban i.religion literacy educ_years i.yr_int /*
*/ [pweight= ind_samplewt]
 
//round two, demographic factors + wealth - region 
corr age age2 urban literacy educ_years wealth_score_ruralwt work
eststo:logistic unmet5 age age2 age_firstchild urban i.religion literacy educ_years i.yr_int /*
*/i.wealth_ruralwt work /*
*/ [pweight= ind_samplewt]

//round three, demographic factors + wealth + access - region 
corr age age2 age_firstchild urban literacy educ_years wealth_score_ruralwt work visitfw visit_healthfac
eststo: logistic unmet5 age age2 age_firstchild urban i.religion literacy educ_years i.yr_int /*
*/i.wealth_ruralwt work /*
*/visitfw visit_healthfac/*
*/[pweight= ind_samplewt]

//round four, demographic factors + wealth + access + empowerment - region 
corr age age2 age_firstchild urban literacy educ_years wealth_score_ruralwt work visitfw visit_healthfac cond_ask control_sum emotional_total less_violence severe_violence sexual_violence
eststo: logistic unmet5 age age2 age_firstchild urban i.religion literacy educ_years i.yr_int ///
i.wealth_ruralwt work ///
visitfw visit_healthfac ///
cond_ask control_sum emotional_total less_violence severe_violence sexual_violence ///
[pweight= ind_samplewt]

esttab est1 est2 est3 est4, se star(* 0.10 ** 0.05 *** 0.01) label
