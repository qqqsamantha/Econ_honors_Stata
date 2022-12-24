cd "/Users/apple/Desktop/honor_final"
use "/Users/apple/Desktop/honor_all_state_05.dta", clear

*full reopen count as reopen in the dynamic version
cd "/Users/apple/Desktop/honor_final"
use "/Users/apple/Desktop/honor_all_state_06_full_open_dynamic.dta", clear

drop if labforce==0
drop if labforce==1
drop if empstat==0
gen employed=0
replace employed=1 if empstat==1
replace employed=1 if empstat==10
replace employed=1 if empstat==12
gen female=0
replace female=1 if sex==2

gen ch = inrange(yngch, 5, 18) | inrange(eldch, 5, 18)

drop if ch==0
gen date = ym(year,month) 
format date %tm 

replace new_cases=new_cases/1000000


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

*education
gen education=1 if educ<=79
replace education=2 if educ>=80
drop if education==.

*difficulty
gen difficulty=0 if diffany==1
replace difficulty=1 if diffany==2
drop if difficulty==.

* hybrid as reopen
replace sch_reopen=1 if sch_reopen==2

gen female_clo=female*sch_clo
gen female_reopen=female*sch_reopen

keep if year==2018 & month>=8 | year>=2019
gen period=0 if year==2018|year==2019|year==2020 & month<=2
replace period=1 if year==2020 & month>=3 & month<=7
replace period=2 if year==2020 & month>=8|year==2021

egen industry_time=group(industry date)
egen occ_time=group(occupation date)

gen white=race==100
*set income as min number of the range
gen income=0 if faminc==100
replace income=5000 if faminc==210
replace income=7500 if faminc==300
replace income=10000 if faminc==430
replace income=12500 if faminc==470
replace income=15000 if faminc==500
replace income=20000 if faminc==600
replace income=25000 if faminc==710
replace income=30000 if faminc==720
replace income=35000 if faminc==730
replace income=40000 if faminc==740
replace income=50000 if faminc==820
replace income=60000 if faminc==830
replace income=75000 if faminc==841
replace income=100000 if faminc==842
replace income=150000 if faminc==843

replace new_cases=new_cases/1000000
replace age=age/100
replace income=income/1000000
* hybrid as reopen


logit employed female sch_clo female_clo age new_cases fully_vacc_rate pernum income difficulty education white  i.statefip i.industry i.occ_time  if year<=2019 |year==2020 & month<=7

outreg2 using sta_state_hybrid.doc, replace ctitle(closure only) keep(female sch_clo female_clo age new_cases fully_vacc_rate pernum income difficulty education white)

logit employed female sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white  i.statefip i.industry i.occ_time if year==2020 & month>=4 | year==2021

outreg2 using sta_state_hybrid.doc, append ctitle(reopen only) keep(female sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white)


logit employed female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white  i.statefip i.industry i.occ_time 

outreg2 using sta_state_hybrid.doc, append ctitle(closure+reopen) keep(female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white)

drop if ahrsworkt==999
gen hrsworkmonth=4*ahrsworkt
gen loghrsmonth=log(hrsworkmonth)

reg loghrsmonth female sch_clo female_clo age new_cases fully_vacc_rate pernum income difficulty education white  i.statefip i.industry i.occ_time  if year<=2019 |year==2020 & month<=7

outreg2 using sta_state_hybrid.doc, append ctitle(closure only) keep(female sch_clo female_clo age new_cases fully_vacc_rate pernum income difficulty education white)

reg loghrsmonth female sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white  i.statefip i.industry i.occ_time if year==2020 & month>=4 | year==2021

outreg2 using sta_state_hybrid.doc, append ctitle(reopen only) keep(female sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white)

reg loghrsmonth female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white i.statefip i.industry i.occ_time 

outreg2 using sta_state_hybrid.doc, append ctitle(closure+reopen) keep(female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white)

*full reopen
logit employed female sch_clo female_clo age new_cases fully_vacc_rate pernum income difficulty education white  i.statefip i.industry i.occ_time  if year<=2019 |year==2020 & month<=7

outreg2 using sta_state_full.doc, replace ctitle(closure only) keep(female sch_clo female_clo age new_cases fully_vacc_rate pernum income difficulty education white)

logit employed female sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white  i.statefip i.industry i.occ_time if year==2020 & month>=4 | year==2021

outreg2 using sta_state_full.doc, append ctitle(reopen only) keep(female sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white)


logit employed female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white  i.statefip i.industry i.occ_time 

outreg2 using sta_state_full.doc, append ctitle(closure+reopen) keep(female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white)

drop if ahrsworkt==999
gen hrsworkmonth=4*ahrsworkt
gen loghrsmonth=log(hrsworkmonth)

reg loghrsmonth female sch_clo female_clo age new_cases fully_vacc_rate pernum income difficulty education white  i.statefip i.industry i.occ_time  if year<=2019 |year==2020 & month<=7

outreg2 using sta_state_full.doc, append ctitle(closure only) keep(female sch_clo female_clo age new_cases fully_vacc_rate pernum income difficulty education white)

reg loghrsmonth female sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white  i.statefip i.industry i.occ_time if year==2020 & month>=4 | year==2021

outreg2 using sta_state_full.doc, append ctitle(reopen only) keep(female sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white)

reg loghrsmonth female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white i.statefip i.industry i.occ_time 

outreg2 using sta_state_full.doc, append ctitle(closure+reopen) keep(female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate pernum income difficulty education white)

