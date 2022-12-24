
cd "/Users/apple/Desktop/honor_dofile"
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

gen ch = inrange(yngch, 5, 18) | inrange(eldch, 5, 18)

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

*full reopen as open
replace sch_reopen=0 if sch_reopen==1
replace sch_reopen=1 if sch_reopen==2

gen female_clo=female*sch_clo
gen female_reopen=female*sch_reopen

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
gen education=0 if educ<=79
replace education=1 if educ>=80
drop if education==.

*difficulty
gen difficulty=0 if diffany==1
replace difficulty=1 if diffany==2
drop if difficulty==.

* hybrid as reopen
replace sch_reopen=1 if sch_reopen==2

gen white=race==100

keep if year==2018 & month>=8 | year>=2019

gen hrsworkmonth=4*ahrsworkt

gen period=0 if year==2018|year==2019|year==2020 & month<=2
replace period=1 if year==2020 & month>=3 & month<=7
replace period=2 if year==2020 & month>=8|year==2021

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

sort year month serial
drop tot emp fe
bysort year month female: gen tot=_n
bysort year month female: gen tot=_n
drop emp
bysort year month : egen emp=sum(employed)

bysort year month employed: egen fe=sum(female)

bysort year month: generate all =_N
drop emp
bysort year month: generate emp =_N if employed==1
all
bysort year month: gen all=tot[-1]
bysort year month: gen all=sum(_n)
gen all=
bysort year month: gen tot=_n
drop all
bysort year month: gen all=count(female)
summarize employed if female==0 & year<=2019|female==0 & year==2020 & month<=2 
summarize employed if female==1 & year<=2019|female==0 & year==2020 & month<=2

ttest employed if female==0 & period!=2, by(period)
ttest employed if female==0 & period!=0, by(period)

ttest employed if female==1 & period!=2, by(period)
ttest employed if female==1 & period!=0, by(period)

summarize employed if female==0 & year==2020 & month>=3 &month<=8  
summarize employed if female==1 & year==2020 & month>=3 &month<=8
ttest employed if year==2020 & month>=3 &month<=8,by(female)

summarize employed if female==0 & year==2020 & month>=9|female==0 & year==2021  
summarize employed if female==1 & year==2020 & month>=9|female==1 & year==2021

summarize hrsworkmonth if ahrsworkt!=999 & female==0 & year<=2019|ahrsworkt!=999 & female==0 & year==2020 & month<=2 
summarize hrsworkmonth if ahrsworkt!=999 & female==1 & year<=2019|ahrsworkt!=999 & female==0 & year==2020 & month<=2

summarize hrsworkmonth if ahrsworkt!=999 & female==0 & year==2020 & month>=9|ahrsworkt!=999 &female==0 & year==2021
summarize hrsworkmonth if ahrsworkt!=999 & female==1 & year==2020 & month>=9|ahrsworkt!=999 &female==1 & year==2021

summarize hrsworkmonth if ahrsworkt!=999 & female==0 & year==2020 & month>=3 &month<=8 
summarize hrsworkmonth if ahrsworkt!=999 & female==1 & year==2020 & month>=3 &month<=8 

ttest hrsworkmonth if ahrsworkt!=999 & female==0 & period!=2, by(period)
ttest hrsworkmonth if ahrsworkt!=999 & female==0 & period!=0, by(period)

ttest hrsworkmonth if ahrsworkt!=999 & female==1 & period!=2, by(period)
ttest hrsworkmonth if ahrsworkt!=999 & female==1 & period!=0, by(period)

summarize female white education income pernum if year<=2019|year==2020 & month<=2
summarize female white education income pernum if year==2020 & month>=3 &month<=8
summarize female white education income pernum if year==2020 & month>=9|year==2021

ttest education if period!=2, by(period)
ttest education if period!=0, by(period)

summarize female white education income pernum if year<=2019|year==2020 & month<=2
summarize female white education income pernum if year==2020 & month>=3 &month<=8
summarize female white education income pernum if year==2020 & month>=9|year==2021

ttest pernum if period!=2, by(period)
ttest pernum if period!=0, by(period)

logit employed female sch_clo female_clo age new_cases fully_vacc_rate pernum difficulty education white  i.county i.faminc i.industry i.occ_time  if year<=2019 |year==2020 & month<=7

summarize employed if female==0 & year<=2019|female==0 & year==2020 & month<=2 
summarize employed if female==1 & year<=2019|female==0 & year==2020 & month<=2

summarize employed if female==0 & year==2020 & month>=3 &month<=7  
summarize employed if female==1 & year==2020 & month>=3 &month<=7

summarize employed if female==0 & year==2020 & month>=8|female==0 & year==2021  
summarize employed if female==1 & year==2020 & month>=8|female==1 & year==2021

summarize hrsworkmonth if ahrsworkt!=999 & female==0 & year<=2019|ahrsworkt!=999 & female==0 & year==2020 & month<=2 
summarize hrsworkmonth if ahrsworkt!=999 & female==1 & year<=2019|ahrsworkt!=999 & female==0 & year==2020 & month<=2

summarize hrsworkmonth if ahrsworkt!=999 & female==0 & year==2020 & month>=8|ahrsworkt!=999 &female==0 & year==2021
summarize hrsworkmonth if ahrsworkt!=999 & female==1 & year==2020 & month>=8|ahrsworkt!=999 &female==1 & year==2021

summarize hrsworkmonth if ahrsworkt!=999 & female==0 & year==2020 & month>=3 &month<=7 
summarize hrsworkmonth if ahrsworkt!=999 & female==1 & year==2020 & month>=3 &month<=7 

summarize female white education income pernum if year<=2019|year==2020 & month<=2
summarize female white education income pernum if year==2020 & month>=3 &month<=7
summarize female white education income pernum if year==2020 & month>=8|year==2021

by female:summarize employed if (year<=2019| year==2020 & month<=3)

outreg2 using data_state.doc, replace ctitle(pre-closure) keep(female sch_clo female_clo age new_cases fully_vacc_rate) 

ttest employed if female==0 & period!=1, by(period)
oneway employed if female==0 period,bonferroni

summarize employed if female==0 & period==0
outreg2 using data_state.doc, replace ctitle(pre-closure)


gen period=0 if year==2018|year==2019|year==2020 & month<=2
replace period=1 if year==2020 & month>=3 & month<=7
replace period=2 if year==2020 & month>=8|year==2021
summarize female  age pernum difficulty education
twoway line new_cases date, by(statefip)
twoway line fully_vacc_rate date, by(statefip)
twoway line sch_reopen date, by(statefip)

tabstat female age pernum difficulty 
kdensity education
