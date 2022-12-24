cd "/Users/apple/Desktop"
use "/Users/apple/Desktop/honor_CA_06_dynamic.dta", clear
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

gen female_clo=female*sch_clo
gen female_reopen=female*sch_reopen

keep if year==2018 & month>=8 | year>=2019


reg employed pre_reopen_12 pre_reopen_11 pre_reopen_10 pre_reopen_9 pre_reopen_8 pre_reopen_7 pre_reopen_6 pre_reopen_5 pre_reopen_4 pre_reopen_3 pre_reopen_2 pre_reopen_1 post_reopen_1 post_reopen_2 post_reopen_3 post_reopen_4 post_reopen_5 post_reopen_6 post_reopen_7 post_reopen_8 post_reopen_9 post_reopen_10 post_reopen_11 post_reopen_12 age new_cases fully_vacc_rate i.industry i.date i.county if female==0

estimates store male

reg employed pre_reopen_12 pre_reopen_11 pre_reopen_10 pre_reopen_9 pre_reopen_8 pre_reopen_7 pre_reopen_6 pre_reopen_5 pre_reopen_4 pre_reopen_3 pre_reopen_2 pre_reopen_1 post_reopen_1 post_reopen_2 post_reopen_3 post_reopen_4 post_reopen_5 post_reopen_6 post_reopen_7 post_reopen_8 post_reopen_9 post_reopen_10 post_reopen_11 post_reopen_12 age new_cases fully_vacc_rate i.industry i.date i.county if female==1

estimates store female

forvalues i=1/12 {
	label var pre_reopen_`i' "p`i'"
	label var post_reopen_`i' "a`i'"
}

coefplot (male,label (male)) (female,label (female)), vertical drop(_cons age new_cases fully_vacc_rate  *.industry *.county *.date pre_reopen_12 pre_reopen_11 pre_reopen_10 pre_reopen_9 pre_reopen_8  post_reopen_8 post_reopen_9 post_reopen_10 post_reopen_11 post_reopen_12 ) recast(scatter) ciopt(color(%20)) nooffsets

coefplot (male,label (male)) (female,label (female)), vertical drop(_cons age new_cases fully_vacc_rate *.industry *.date *.county) recast(scatter) ciopt(color(%20)) nooffsets

drop if ahrsworkt==999
gen hrsworkmonth=4*ahrsworkt
gen loghrsmonth=log(hrsworkmonth)

reg loghrsmonth pre_reopen_12 pre_reopen_11 pre_reopen_10 pre_reopen_9 pre_reopen_8 pre_reopen_7 pre_reopen_6 pre_reopen_5 pre_reopen_4 pre_reopen_3 pre_reopen_2 pre_reopen_1 post_reopen_1 post_reopen_2 post_reopen_3 post_reopen_4 post_reopen_5 post_reopen_6 post_reopen_7 post_reopen_8 post_reopen_9 post_reopen_10 post_reopen_11 post_reopen_12 age new_cases fully_vacc_rate i.industry i.statefip i.date if female==0 & employed==1

estimates store male

reg loghrsmonth pre_reopen_12 pre_reopen_11 pre_reopen_10 pre_reopen_9 pre_reopen_8 pre_reopen_7 pre_reopen_6 pre_reopen_5 pre_reopen_4 pre_reopen_3 pre_reopen_2 pre_reopen_1 post_reopen_1 post_reopen_2 post_reopen_3 post_reopen_4 post_reopen_5 post_reopen_6 post_reopen_7 post_reopen_8 post_reopen_9 post_reopen_10 post_reopen_11 post_reopen_12 age new_cases fully_vacc_rate i.industry i.statefip i.date if female==1 & employed==1

estimates store female







