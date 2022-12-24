*original
cd "/Users/apple/Desktop/honor_dofile"
use "/Users/apple/Desktop/honor_all_state_05.dta", clear

*full reopen count as reopen in the dynamic version
cd "/Users/apple/Desktop/honor_dofile"
use "/Users/apple/Desktop/honor_all_state_06_full_open_dynamic.dta", clear

*hybrid reopen count as reopen in the dynamic version
cd "/Users/apple/Desktop/honor_dofile"
use "/Users/apple/Desktop/honor_all_state_07_hybrid_dynamic.dta", clear
   
keep if statefip==4|statefip==48|statefip==12|statefip==19|statefip==20|statefip==41|statefip==29|statefip==33|statefip==35|statefip==37|statefip==41|statefip==45|statefip==48|statefip==53|statefip==54|statefip==6|statefip==11|statefip==15|statefip==21

drop if labforce==0
drop if labforce==1
drop if empstat==0
gen employed=0
replace employed=1 if empstat==1
replace employed=1 if empstat==10
replace employed=1 if empstat==12
gen female=0
replace female=1 if sex==2

gen ch = inrange(yngch, 5, 12) | inrange(eldch, 5, 18)

drop if ch==0
gen date = ym(year,month) 
format date %tm 

replace new_cases=new_cases/1000000

* add industry
gen industry=1 if ind>=170 &ind<=290
replace industry=2 if ind>=370 &ind<=490
replace industry=3 if ind==770 
replace industry=4 if ind>=1070 &ind<=3990
replace industry=5 if ind>=4070 &ind<=5790
replace industry=6 if ind>=6070 &ind<=6390
replace industry=6 if ind>=570 &ind<=690
replace industry=7 if ind>=6470 &ind<=6780
replace industry=8 if ind>=6870 &ind<=7190
replace industry=9 if ind>=7270 &ind<=7790
replace industry=10 if ind>=7860 &ind<=8470
replace industry=11 if ind>=8560 &ind<=8690
replace industry=12 if ind>=8770 &ind<=9290
replace industry=13 if ind>=9370 &ind<=9590
replace industry=13 if ind==9890
drop if industry==.

*add occupation
*Management, Business, Science, and Arts Occupations
*Management, Business, and Financial Occupations
gen occupation=1 if occ>=10 & occ<=960
*Computer, Engineering, and Science Occupations
replace occupation=2 if occ>=1005 & occ<=1980
*Education, Legal, Community Service, Arts, and Media Occupations
replace occupation=3 if occ>=2001 & occ<=2970
*Healthcare Practitioners and Technical Occupations
replace occupation=4 if occ>=3000 & occ<=3550
*Service Occupations 
replace occupation=5 if occ>=3601 & occ<=4665
*Sales and Office Occupations
*Sales and Related Occupations
replace occupation=6 if occ>=4700 & occ<=4965
*Office and Administrative Support Occupations
replace occupation=7 if occ>=5000 & occ<=5940
*Natural Resources, Construction, and Maintenance Occupations
*Farming, Fishing, and Forestry Occupations
replace occupation=8 if occ>=6005 & occ<=6130
*Construction and Extraction Occupations
replace occupation=9 if occ>=6200 & occ<=6950
*Installation, Maintenance, and Repair Occupations
replace occupation=10 if occ>=7000 & occ<=7640
*Production, Transportation, and Material Moving Occupations
*Production Occupations
replace occupation=11 if occ>=7700 & occ<=8990
*Transportation and Material Moving Occupations:
replace occupation=12 if occ>=9005 & occ<=9760
*Military Specific Occupations
replace occupation=13 if occ>=9800 & occ<=9830

drop if occupation==.

*full reopen as open
replace sch_reopen=0 if sch_reopen==1
replace sch_reopen=1 if sch_reopen==2


gen female_clo=female*sch_clo
gen female_reopen=female*sch_reopen

keep if year==2018 & month>=8 | year>=2019
gen period=0 if year==2018|year==2019|year==2020 & month<=2
replace period=1 if year==2020 & month>=3 & month<=7
replace period=2 if year==2020 & month>=8|year==2021

egen industry_time=group(industry date)

* full reopen as reopen
logit employed female sch_clo female_clo age new_cases fully_vacc_rate i.industry_time i.statefip if year<=2019 |year==2020 & month<=7
outreg2 using sta_state_seperate_effects_fullreopen.doc, replace ctitle(closure only) keep(female sch_clo female_clo age new_cases fully_vacc_rate)

logit employed female sch_reopen female_reopen age new_cases fully_vacc_rate i.industry_time i.statefip if year==2020 & month>=4 | year==2021
outreg2 using sta_state_seperate_effects_fullreopen.doc, append ctitle(reopen only) keep(female sch_reopen female_reopen age new_cases fully_vacc_rate)

logit employed female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate i.industry_time i.statefip 
outreg2 using sta_state_seperate_effects_fullreopen.doc, append ctitle(closure+reopen) keep(female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate)

drop if ahrsworkt==999
gen hrsworkmonth=4*ahrsworkt
gen loghrsmonth=log(hrsworkmonth)

drop if employed==0
reg loghrsmonth female sch_clo female_clo age new_cases fully_vacc_rate i.date i.statefip i.industry if year<=2019 |year==2020 & month<=7
outreg2 using sta_state_seperate_effects_fullreopen.doc, append ctitle(closure only) keep(female sch_clo female_clo age new_cases fully_vacc_rate) 

reg loghrsmonth female sch_reopen female_reopen age new_cases fully_vacc_rate i.date i.statefip i.industry if year==2020 & month>=4 | year==2021
outreg2 using sta_state_seperate_effects_fullreopen.doc, append ctitle(reopen only) keep(female sch_reopen female_reopen age new_cases fully_vacc_rate) 

reg loghrsmonth female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate i.date i.statefip i.industry
outreg2 using sta_state_seperate_effects_fullreopen.doc, append ctitle(closure+reopen) keep(female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate) 
