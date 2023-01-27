cd "/Users/apple/Desktop"
use "/Users/apple/Desktop/honor_CA_05.dta", clear

****************************************************************************************
*Data Cleaning
****************************************************************************************
*Set closure variable
gen sch_clo=0
replace sch_clo=1 if year==2021
replace sch_clo=1 if year==2020 & month==3
replace sch_clo=1 if year==2020 & month==4
replace sch_clo=1 if year==2020 & month==5
replace sch_clo=1 if year==2020 & month==6
replace sch_clo=1 if year==2020 & month==7
replace sch_clo=1 if year==2020 & month==8
replace sch_clo=1 if year==2020 & month==9
replace sch_clo=1 if year==2020 & month==10
replace sch_clo=1 if year==2020 & month==11
replace sch_clo=1 if year==2020 & month==12

*Set reopening variable; 0 for closed, 1 for partical closed, 2 for fully reopened
*Add State level static school policy 
gen sch_reop=0
*Iowa
replace sch_reop=1 if state==19 & year== 2020 & month==8 
replace sch_clo=0 if state==19 & year== 2020 & month==8
*Missouri
replace sch_reop=1 if state==29 & year== 2020 & month==8 
replace sch_clo=0 if state==29 & year== 2020 & month==8
*Texas
replace sch_reop=1 if state==48 & year== 2020 & month==8 
replace sch_clo=0 if state==48 & year== 2020 & month==8
*Florida
replace sch_reop=1 if state==12 & year== 2020 & month==8 
replace sch_clo=0 if state==12 & year== 2020 & month==8
*Florida
replace sch_reop=1 if state==12 & year== 2020 & month==8 
replace sch_clo=0 if state==12 & year== 2020 & month==8
*Arkansas
replace sch_reop=1 if state==5 & year== 2020 & month==9
replace sch_clo=0 if state==5 & year== 2020 & month==9
*Florida
replace sch_reop=1 if state==12 & year== 2020 & month==9
replace sch_clo=0 if state==12 & year== 2020 & month==9
*Iowa
replace sch_reop=1 if state==19 & year== 2020 & month==9 
replace sch_clo=0 if state==19 & year== 2020 & month==9
*Texas
replace sch_reop=1 if state==48 & year== 2020 & month==9
replace sch_clo=0 if state==48 & year== 2020 & month==9
*Arkansas
replace sch_reop=2 if state==5 & year== 2020 & month==10
replace sch_clo=0 if state==5 & year== 2020 & month==10
*California
replace sch_reop=1 if state==6 & year== 2020 & month==10
replace sch_clo=0 if state==6 & year== 2020 & month==10
*Florida
replace sch_reop=2 if state==12 & year== 2020 & month==10
replace sch_clo=0 if state==12 & year== 2020 & month==10
*Hawaii
replace sch_reop=1 if state==15 & year== 2020 & month==10
replace sch_clo=0 if state==15 & year== 2020 & month==10
*Iowa
replace sch_reop=2 if state==19 & year== 2020 & month==10
replace sch_clo=0 if state==19 & year== 2020 & month==10
*New Mexico
replace sch_reop=1 if state==35 & year== 2020 & month==10
replace sch_clo=0 if state==35 & year== 2020 & month==10
*North Carolina
replace sch_reop=1 if state==37 & year== 2020 & month==10
replace sch_clo=0 if state==37 & year== 2020 & month==10
*Oregon
replace sch_reop=1 if state==41 & year== 2020 & month==10
replace sch_clo=0 if state==41 & year== 2020 & month==10
*Texas
replace sch_reop=2 if state==48 & year== 2020 & month==10
replace sch_clo=0 if state==48 & year== 2020 & month==10
*West Virginia
replace sch_reop=1 if state==54 & year== 2020 & month==10
replace sch_clo=0 if state==54 & year== 2020 & month==10
*Arkansas
replace sch_reop=2 if state==5 & year== 2020 & month==11
replace sch_clo=0 if state==5 & year== 2020 & month==11
*California
replace sch_reop=1 if state==6 & year== 2020 & month==11
replace sch_clo=0 if state==6 & year== 2020 & month==11
*Delaware
replace sch_reop=1 if state==10 & year== 2020 & month==11
replace sch_clo=0 if state==10 & year== 2020 & month==11
*Florida
replace sch_reop=2 if state==12 & year== 2020 & month==11
replace sch_clo=0 if state==12 & year== 2020 & month==11
*Hawaii
replace sch_reop=1 if state==15 & year== 2020 & month==11
replace sch_clo=0 if state==15 & year== 2020 & month==11
*Iowa
replace sch_reop=2 if state==19 & year== 2020 & month==11
replace sch_clo=0 if state==19 & year== 2020 & month==11
*Michigan
replace sch_reop=1 if state==26 & year== 2020 & month==11
replace sch_clo=0 if state==26 & year== 2020 & month==11
*New Mexico
replace sch_reop=1 if state==35 & year== 2020 & month==11
replace sch_clo=0 if state==35 & year== 2020 & month==11
*New York
replace sch_reop=1 if state==36 & year== 2020 & month==11
replace sch_clo=0 if state==36 & year== 2020 & month==11
*North Carolina
replace sch_reop=1 if state==37 & year== 2020 & month==11
replace sch_clo=0 if state==37 & year== 2020 & month==11
*Oregon
replace sch_reop=1 if state==41 & year== 2020 & month==11
replace sch_clo=0 if state==41 & year== 2020 & month==11
*Texas
replace sch_reop=2 if state==48 & year== 2020 & month==11
replace sch_clo=0 if state==48 & year== 2020 & month==11
*Arkansas
replace sch_reop=2 if state==5 & year== 2020 & month==12
replace sch_clo=0 if state==5 & year== 2020 & month==12
*California
replace sch_reop=1 if state==6 & year== 2020 & month==12
replace sch_clo=0 if state==6 & year== 2020 & month==12
*Delaware
replace sch_reop=1 if state==10 & year== 2020 & month==12
replace sch_clo=0 if state==10 & year== 2020 & month==12
*Florida
replace sch_reop=2 if state==12 & year== 2020 & month==12
replace sch_clo=0 if state==12 & year== 2020 & month==12
*Hawaii
replace sch_reop=1 if state==15 & year== 2020 & month==12
replace sch_clo=0 if state==15 & year== 2020 & month==12
*Iowa
replace sch_reop=2 if state==19 & year== 2020 & month==12
replace sch_clo=0 if state==19 & year== 2020 & month==12
*Kentucky
replace sch_reop=1 if state==21 & year== 2020 & month==12
replace sch_clo=0 if state==21 & year== 2020 & month==12
*New Mexico
replace sch_reop=1 if state==35 & year== 2020 & month==12
replace sch_clo=0 if state==35 & year== 2020 & month==12
*New York
replace sch_reop=1 if state==36 & year== 2020 & month==12
replace sch_clo=0 if state==36 & year== 2020 & month==12
*North Carolina
replace sch_reop=1 if state==37 & year== 2020 & month==12
replace sch_clo=0 if state==37 & year== 2020 & month==12
*Oregon
replace sch_reop=1 if state==41 & year== 2020 & month==12
replace sch_clo=0 if state==41 & year== 2020 & month==12
*Rhode Island
replace sch_reop=1 if state==44 & year== 2020 & month==12
replace sch_clo=0 if state==44 & year== 2020 & month==12
*Texas
replace sch_reop=2 if state==48 & year== 2020 & month==12
replace sch_clo=0 if state==48 & year== 2020 & month==12
*Arkansas
replace sch_reop=2 if state==5 & year== 2021 & month==1
replace sch_clo=0 if state==5 & year== 2021 & month==1
*California
replace sch_reop=1 if state==6 & year== 2021 & month==1
replace sch_clo=0 if state==6 & year== 2021 & month==1
*Delaware
replace sch_reop=1 if state==10 & year== 2021 & month==1
replace sch_clo=0 if state==10 & year== 2021 & month==1
*Florida
replace sch_reop=2 if state==12 & year== 2021 & month==1
replace sch_clo=0 if state==12 & year== 2021 & month==1
*Florida
replace sch_reop=2 if state==12 & year== 2021 & month==1
replace sch_clo=0 if state==12 & year== 2021 & month==1
*Iowa
replace sch_reop=2 if state==19 & year== 2021 & month==1
replace sch_clo=0 if state==19 & year== 2021 & month==1
*New Mexico
replace sch_reop=1 if state==35 & year== 2021 & month==1
replace sch_clo=0 if state==35 & year== 2021 & month==1
*North Carolina
replace sch_reop=1 if state==37 & year== 2021 & month==1
replace sch_clo=0 if state==37 & year== 2021 & month==1
*Texas
replace sch_reop=2 if state==48 & year== 2021 & month==1
replace sch_clo=0 if state==48 & year== 2021 & month==1
*West Virginia
replace sch_reop=1 if state==54 & year== 2021 & month==1
replace sch_clo=0 if state==54 & year== 2021 & month==1
*02/26/21
*Arkansas
replace sch_reop=2 if state==5 & year== 2021 & month==2
replace sch_clo=0 if state==5 & year== 2021 & month==2
*California
replace sch_reop=1 if state==6 & year== 2021 & month==2
replace sch_clo=0 if state==6 & year== 2021 & month==2
*Delaware
replace sch_reop=1 if state==10 & year== 2021 & month==2
replace sch_clo=0 if state==10 & year== 2021 & month==2
*District of DC
replace sch_reop=1 if state==11 & year== 2021 & month==2
replace sch_clo=0 if state==11 & year== 2021 & month==2
*Florida
replace sch_reop=2 if state==12 & year== 2021 & month==2
replace sch_clo=0 if state==12 & year== 2021 & month==2
*Hawaii
replace sch_reop=1 if state==15 & year== 2021 & month==2
replace sch_clo=0 if state==15 & year== 2021 & month==2
*Iowa
replace sch_reop=2 if state==19 & year== 2021 & month==2
replace sch_clo=0 if state==19 & year== 2021 & month==2
*New Mexico
replace sch_reop=1 if state==35 & year== 2021 & month==2
replace sch_clo=0 if state==35 & year== 2021 & month==2
*Texas
replace sch_reop=2 if state==48 & year== 2021 & month==2
replace sch_clo=0 if state==48 & year== 2021 & month==2
*West Virginia
replace sch_reop=1 if state==54 & year== 2021 & month==2
replace sch_clo=0 if state==54 & year== 2021 & month==2
*03/26/21
*Arizona
replace sch_reop=1 if state==4 & year== 2021 & month==3
replace sch_clo=0 if state==4 & year== 2021 & month==3
*Arkansas
replace sch_reop=2 if state==5 & year== 2021 & month==3
replace sch_clo=0 if state==5 & year== 2021 & month==3
*Delaware
replace sch_reop=1 if state==10 & year== 2021 & month==3
replace sch_clo=0 if state==10 & year== 2021 & month==3
*District of DC
replace sch_reop=1 if state==11 & year== 2021 & month==3
replace sch_clo=0 if state==11 & year== 2021 & month==3
*Florida
replace sch_reop=2 if state==12 & year== 2021 & month==3
replace sch_clo=0 if state==12 & year== 2021 & month==3
*Hawaii
replace sch_reop=1 if state==15 & year== 2021 & month==3
replace sch_clo=0 if state==15 & year== 2021 & month==3
*Iowa
replace sch_reop=2 if state==19 & year== 2021 & month==3
replace sch_clo=0 if state==19 & year== 2021 & month==3
*New Hampshire
replace sch_reop=2 if state==33 & year== 2021 & month==3
replace sch_clo=0 if state==33 & year== 2021 & month==3
*Texas
replace sch_reop=2 if state==48 & year== 2021 & month==3
replace sch_clo=0 if state==48 & year== 2021 & month==3
*West Virginia
replace sch_reop=2 if state==54 & year== 2021 & month==3
replace sch_clo=0 if state==54 & year== 2021 & month==3
*04/30/21
*Arizona
replace sch_reop=1 if state==4 & year== 2021 & month==4
replace sch_clo=0 if state==4 & year== 2021 & month==4
*Arkansas
replace sch_reop=2 if state==5 & year== 2021 & month==4
replace sch_clo=0 if state==5 & year== 2021 & month==4
*Delaware
replace sch_reop=1 if state==10 & year== 2021 & month==4
replace sch_clo=0 if state==10 & year== 2021 & month==4
*District of DC
replace sch_reop=1 if state==11 & year== 2021 & month==4
replace sch_clo=0 if state==11 & year== 2021 & month==4
*Florida
replace sch_reop=2 if state==12 & year== 2021 & month==4
replace sch_clo=0 if state==12 & year== 2021 & month==4
*Hawaii
replace sch_reop=1 if state==15 & year== 2021 & month==4
replace sch_clo=0 if state==15 & year== 2021 & month==4
*Iowa
replace sch_reop=2 if state==19 & year== 2021 & month==4
replace sch_clo=0 if state==19 & year== 2021 & month==4
*Kansas
replace sch_reop=2 if state==20 & year== 2021 & month==4
replace sch_clo=0 if state==20 & year== 2021 & month==4
*Massachusetts
replace sch_reop=2 if state==25 & year== 2021 & month==4
replace sch_clo=0 if state==25 & year== 2021 & month==4
*New Hampshire
replace sch_reop=2 if state==33 & year== 2021 & month==4
replace sch_clo=0 if state==33 & year== 2021 & month==4
*New Mexico
replace sch_reop=2 if state==35 & year== 2021 & month==4
replace sch_clo=0 if state==35 & year== 2021 & month==4
*North Carolina
replace sch_reop=2 if state==37 & year== 2021 & month==4
replace sch_clo=0 if state==37 & year== 2021 & month==4
*Oregon
replace sch_reop=2 if state==41 & year== 2021 & month==4
replace sch_clo=0 if state==41 & year== 2021 & month==4
*South Carolina
replace sch_reop=2 if state==45 & year== 2021 & month==4
replace sch_clo=0 if state==45 & year== 2021 & month==4
*Texas
replace sch_reop=2 if state==48 & year== 2021 & month==4
replace sch_clo=0 if state==48 & year== 2021 & month==4
*Washington
replace sch_reop=2 if state==53 & year== 2021 & month==4
replace sch_clo=0 if state==53 & year== 2021 & month==4
*West Virginia
replace sch_reop=2 if state==54 & year== 2021 & month==4
replace sch_clo=0 if state==54 & year== 2021 & month==4

****************************************************************************************

*Add county level static school policy
*select only CA data
keep if statefip==6

*select those with county level data
egen county_code = anymatch(county), values(6001 6007 6013 6017 6019 6023 6025 6029 6031 6037 6039 6041 6047 6053 6055 6059 6061 6065 6067 6071 6073 6075 6077 6079 6081 6083 6087 6089 6095 6097 6099 6107 6111 6113)
keep if county_code

drop fully_vacc_rate
drop new_cases

*combine vacc rate
merge m:1 year month county using "/Users/apple/Desktop/CA_vacc.dta"
drop if _merge==2
drop _merge

*combine cases
merge m:1 year month county using "/Users/apple/Desktop/CA_new_cases_pos_rate.> dta"
drop if _merge==2
drop _merge

*clean the dots in dataset
replace confirmed_cases=0 if confirmed_cases==.
replace new_cases=0 if new_cases==.
replace positive_rate=0 if positive_rate==.
replace at_least_one_dose_rate=0 if at_least_one_dose_rate==.
replace fully_vacc_rate=0 if fully_vacc_rate==.

gen sch_clo=0
replace sch_clo=1 if year==2020 & month>=3
replace sch_clo=1 if year==2021
gen sch_reopen=0

*Alameda
replace sch_reopen=1 if county==6001 & year==2021 &month >= 2 &month<=8
replace sch_reopen=2 if county==6001 & year==2021 &month ==9
replace sch_clo=0 if county==6001 & year==2021 &month >= 2 &month<=9

*Butte
replace sch_reopen=1 if county==6007 & year==2020 &month >= 11 
replace sch_reopen=1 if county==6007 & year==2021 &month<=8
replace sch_reopen=2 if county==6007 & year==2021 &month ==9
replace sch_clo=0 if county==6007 & year==2021 &month<=9
replace sch_clo=0 if county==6007 & year==2020 &month>=11

*Contra Costa	
replace sch_reopen=1 if county==6013 & year==2021 &month >= 1 & month<=5
replace sch_reopen=2 if county==6013 & year==2021 &month >5 & month<=9
replace sch_clo=0 if county==6007 & year==2021 & month >= 1 &month<=9

*El Dorado
replace sch_reopen=1 if county==6017 & year==2020 &month >= 10
replace sch_reopen=1 if county==6017 & year==2021 &month <=3
replace sch_reopen=2 if county==6017 & year==2021 &month >=4 & month<=9
replace sch_clo=0 if county==6017 & year==2020 & month >= 10
replace sch_clo=0 if county==6017 & year==2021 

*Fresno	
replace sch_reopen=1 if county==6019 & year==2020 &month >= 11
replace sch_reopen=1 if county==6019 & year==2021 &month <=4
replace sch_reopen=2 if county==6019 & year==2021 &month <=5 & month<=9
replace sch_clo=0 if county==6019 & year==2020 & month >= 11
replace sch_clo=0 if county==6019 & year==2021 

*Humboldt
replace sch_reopen=1 if county==6023 & year==2021 &month >=2 & month <=4
replace sch_reopen=2 if county==6023 & year==2021 &month >=5 & month <=9
replace sch_clo=0 if county==6023 & year==2021 & month >= 2 & month<=9

*Imperial
replace sch_reopen=1 if county==6025 & year==2021 &month >=2 & month <=4
replace sch_reopen=2 if county==6025 & year==2021 &month >=5 & month <=9
replace sch_clo=0 if county==6025 & year==2021 & month >= 2 & month<=9

*Kern
replace sch_reopen=1 if county==6029 & year==2021 &month >=2 & month <=8
replace sch_reopen=2 if county==6029 & year==2021 &month==9
replace sch_clo=0 if county==6029 & year==2021 & month >= 2 & month<=9

*King
replace sch_reopen=1 if county==6031 & year==2021 &month >=2 & month <=3
replace sch_reopen=2 if county==6031 & year==2021 &month >=4 & month <=9
replace sch_clo=0 if county==6031 & year==2021 & month >= 2 & month<=9

*Los Angeles
replace sch_reopen=1 if county==6037 & year==2021 &month >=2 & month <=6
replace sch_reopen=2 if county==6037 & year==2021 &month >=7 & month <=9
replace sch_clo=0 if county==6037 & year==2021 & month >= 2 & month<=9

*Madera
replace sch_reopen=1 if county==6039 & year==2021 &month >=2 & month <=4
replace sch_reopen=2 if county==6039 & year==2021 &month >=5 & month <=9
replace sch_clo=0 if county==6039 & year==2021 & month >= 2 & month<=9

*Marin
replace sch_reopen=1 if county==6041 & year==2020 &month >= 11
replace sch_reopen=1 if county==6041 & year==2021 &month <=1
replace sch_reopen=2 if county==6041 & year==2021 &month <=2 & month<=9
replace sch_clo=0 if county==6041 & year==2020 & month >= 11
replace sch_clo=0 if county==6041 & year==2021 

*Merced
replace sch_reopen=1 if county==6047 & year==2020 &month >= 9
replace sch_reopen=1 if county==6047 & year==2021 &month <=4
replace sch_reopen=2 if county==6047 & year==2021 &month >=5 & month<=9
replace sch_clo=0 if county==6047 & year==2020 & month >= 9
replace sch_clo=0 if county==6047 & year==2021 

*Monterey
replace sch_reopen=1 if county==6053 & year==2021 &month >=2 & month <=4
replace sch_reopen=2 if county==6053 & year==2021 &month >=5 & month <=9
replace sch_clo=0 if county==6053 & year==2021 & month >= 2 & month<=9

*Napa
replace sch_reopen=1 if county==6055 & year==2020 &month >= 10
replace sch_reopen=1 if county==6055 & year==2021 &month <=4
replace sch_reopen=2 if county==6055 & year==2021 &month >=5 & month<=9
replace sch_clo=0 if county==6055 & year==2020 & month >= 10
replace sch_clo=0 if county==6055 & year==2021 

*Orange
replace sch_reopen=1 if county==6059 & year==2021 &month >=2 & month <=4
replace sch_reopen=2 if county==6059 & year==2021 &month >=5 & month <=9
replace sch_clo=0 if county==6059 & year==2021 & month >= 2 & month<=9

*Placer
replace sch_reopen=1 if county==6061 & year==2021 &month >=2 & month <=5
replace sch_reopen=2 if county==6061 & year==2021 &month >=6 & month <=9
replace sch_clo=0 if county==6061 & year==2021 & month >= 2 & month<=9

*Riverside
replace sch_reopen=1 if county==6065 & year==2021 &month >=2 & month <=8
replace sch_reopen=2 if county==6065 & year==2021 &month ==9
replace sch_clo=0 if county==6065 & year==2021 & month >= 2 & month<=9

*Sacramento
replace sch_reopen=1 if county==6067 & year==2021 &month >=2 & month <=5
replace sch_reopen=2 if county==6067 & year==2021 &month >=6 & month <=9
replace sch_clo=0 if county==6067 & year==2021 & month >= 2 & month<=9

*San Bernardino	
replace sch_reopen=1 if county==6071 & year==2021 &month >=2 & month <=4
replace sch_reopen=2 if county==6071 & year==2021 &month >=5 & month <=9
replace sch_clo=0 if county==6071 & year==2021 & month >= 2 & month<=9

*San Diego	
replace sch_reopen=1 if county==6073 & year==2020 &month >= 9
replace sch_reopen=1 if county==6073 & year==2021 &month <=3
replace sch_reopen=2 if county==6073 & year==2021 &month >=4 & month<=9
replace sch_clo=0 if county==6073 & year==2020 & month >= 9
replace sch_clo=0 if county==6073 & year==2021 

*San Francisco	
replace sch_reopen=1 if county==6075 & year==2021 &month >=2 & month <=8
replace sch_reopen=2 if county==6075 & year==2021 &month ==9
replace sch_clo=0 if county==6075 & year==2021 & month >= 2 & month<=9

*San Joaquin
replace sch_reopen=1 if county==6077 & year==2020 &month >= 11
replace sch_reopen=1 if county==6077 & year==2021 &month <=3
replace sch_reopen=2 if county==6077 & year==2021 &month >=4 & month<=9
replace sch_clo=0 if county==6077 & year==2020 & month >= 11
replace sch_clo=0 if county==6077 & year==2021 

*San Luis Obispo
replace sch_reopen=1 if county==6079 & year==2020 &month >= 11
replace sch_reopen=1 if county==6079 & year==2021 &month <=3
replace sch_reopen=2 if county==6079 & year==2021 &month >=4 & month<=9
replace sch_clo=0 if county==6079 & year==2020 & month >= 11
replace sch_clo=0 if county==6079 & year==2021 

*San Mateo	
replace sch_reopen=1 if county==6081 & year==2021 &month >=2 & month <=4
replace sch_reopen=2 if county==6081 & year==2021 &month >=5 & month <=9
replace sch_clo=0 if county==6081 & year==2021 & month >= 2 & month<=9

*Santa Barbara	
replace sch_reopen=1 if county==6083 & year==2021 &month >=2 & month <=5
replace sch_reopen=2 if county==6083 & year==2021 &month >=6 & month <=9
replace sch_clo=0 if county==6083 & year==2021 & month >= 2 & month<=9

*Santa Cruz	
replace sch_reopen=1 if county==6087 & year==2021 &month >=2 & month <=4
replace sch_reopen=2 if county==6087 & year==2021 &month >=5 & month <=9
replace sch_clo=0 if county==6087 & year==2021 & month >= 2 & month<=9

*Shasta
replace sch_reopen=1 if county==6089 & year==2020 &month >= 10
replace sch_reopen=1 if county==6089 & year==2021 &month <=2
replace sch_reopen=2 if county==6089 & year==2021 &month >=3 & month<=9
replace sch_clo=0 if county==6089 & year==2020 & month >= 10
replace sch_clo=0 if county==6089 & year==2021 

*Solano	
replace sch_reopen=1 if county==6095 & year==2021 &month >=2 & month <=4
replace sch_reopen=2 if county==6095 & year==2021 &month >=5 & month <=9
replace sch_clo=0 if county==6095 & year==2021 & month >= 2 & month<=9

*Sonoma
replace sch_reopen=1 if county==6097 & year==2021 &month >=2 & month <=5
replace sch_reopen=2 if county==6097 & year==2021 &month >=6 & month <=9
replace sch_clo=0 if county==6097 & year==2021 & month >= 2 & month<=9

*Stanislaus
replace sch_reopen=1 if county==6099 & year==2021 &month >=2 & month <=4
replace sch_reopen=2 if county==6099 & year==2021 &month >=5 & month <=9
replace sch_clo=0 if county==6099 & year==2021 & month >= 2 & month<=9

*Tulare
replace sch_reopen=1 if county==6107 & year==2021 &month >=2 & month <=4
replace sch_reopen=2 if county==6107 & year==2021 &month >=5 & month <=9
replace sch_clo=0 if county==6107 & year==2021 & month >= 2 & month<=9

*Ventura
replace sch_reopen=1 if county==6111 & year==2021 &month >=2 & month <=8
replace sch_reopen=2 if county==6111 & year==2021 &month ==9
replace sch_clo=0 if county==6111 & year==2021 & month >= 2 & month<=9

*Yolo
replace sch_reopen=1 if county==6113 & year==2021 &month >=2 & month <=4
replace sch_reopen=2 if county==6113 & year==2021 &month >=5 & month <=9
replace sch_clo=0 if county==6113 & year==2021 & month >= 2 & month<=9

****************************************************************************************
*Add county dynamic school policy
*Alameda:reopen 2021 Feb
replace post_reopen_1=1 if county==6001 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Butte: reopen 2020 Nov
replace post_reopen_1=1 if county==6007 & year==2020 & month==12

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Contra Costa: reopen 2021 Jan
replace post_reopen_1=1 if county==6013 & year==2021 & month==2

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*El Dorado: reopen 2020 Oct
replace post_reopen_1=1 if county==6017 & year==2020 & month==11

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Humboldt: reopen 2021 Feb
replace post_reopen_1=1 if county==6023 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Imperial: reopen 2021 Feb
replace post_reopen_1=1 if county==6025 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Kern: reopen 2021 Feb
replace post_reopen_1=1 if county==6029 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*King: reopen 2021 Feb
replace post_reopen_1=1 if county==6031 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Los Angeles: reopen 2021 Feb
replace post_reopen_1=1 if county==6037 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Madera: reopen 2021 Feb
replace post_reopen_1=1 if county==6039 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Marin: reopen 2020 Nov
replace post_reopen_1=1 if county==6041 & year==2020 & month==12

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Merced reopen 2020 Sep
replace post_reopen_1=1 if county==6047 & year==2020 & month==10

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Monterey reopen 2021 Feb
replace post_reopen_1=1 if county==6053 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Napa reopen 2020 Oct
replace post_reopen_1=1 if county==6055 & year==2020 & month==11

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Orange reopen 2021 Feb
replace post_reopen_1=1 if county==6059 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Placer reopen 2021 Feb
replace post_reopen_1=1 if county==6061 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Riverside reopen 2021 Feb
replace post_reopen_1=1 if county==6065 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Sacramento reopen 2021 Feb
replace post_reopen_1=1 if county==6067 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*San Bernardino reopen 2021 Feb
replace post_reopen_1=1 if county==6071 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*San Diego reopen 2020 Sep
replace post_reopen_1=1 if county==6073 & year==2020 & month==10

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*San Francisco reopen 2021 Feb
replace post_reopen_1=1 if county==6075 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*San Joaquin reopen 2020 Nov
replace post_reopen_1=1 if county==6077 & year==2020 & month==12

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*San Luis Obispo reopen 2020 Nov
replace post_reopen_1=1 if county==6079 & year==2020 & month==12

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*San Mateo reopen 2021 Feb
replace post_reopen_1=1 if county==6081 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Santa Barbara reopen 2021 Feb
replace post_reopen_1=1 if county==6083 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Santa Cruz reopen 2021 Feb
replace post_reopen_1=1 if county==6087 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Shasta reopen 2020 Oct
replace post_reopen_1=1 if county==6089 & year==2020 & month==11

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Solano reopen 2021 Feb
replace post_reopen_1=1 if county==6095 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Sonoma reopen 2021 Feb
replace post_reopen_1=1 if county==6097 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Stanislaus reopen Feb 2021
replace post_reopen_1=1 if county==6099 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Tulare reopen 2021 Feb
replace post_reopen_1=1 if county==6107 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Ventura reopen 2021 Feb
replace post_reopen_1=1 if county==6111 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

*Yolo reopen 2021 Feb
replace post_reopen_1=1 if county==6113 & year==2021 & month==3

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

forvalues i=1/12 {
	gen post_reopen_`i'=0
	replace post_reopen_`i'=1 if sch_reopen>0 & sch_reopen[_n+1-`i']==0
}

forvalues i=1/12 {
	gen pre_reopen_`i'=0
	replace pre_reopen_`i'=1 if sch_reopen==0 & sch_reopen[_n+`i']>0
}

****************************************************************************************
*Data Restrictions and Captions
****************************************************************************************
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

****************************************************************************************
*Data Discriptions
****************************************************************************************
*Generating necessary average/total employment rate for data discription

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

****************************************************************************************
*Creating time plot for employment
sort year serial
bysort year  female: gen tot=_n
bysort year  female: gen TOT=_N
bysort year  female : egen emp=sum(empstat)
gen emprate=100*emp/TOT
gen emprateM=100*emp/TOT if female==0
gen emprateF=100*emp/TOT if female==1
twoway(line emprateM year if female==0)(line emprateF year if female==1)

****************************************************************************************
**T-test between pre-closure & closure period and closure & reopen period
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

****************************************************************************************
*Creating data summary 
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
****************************************************************************************
*Static Model:Logit 
***************************
**State-Level
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

***************************
**County_Level
logit employed female sch_clo female_clo age new_cases fully_vacc_rate pernum difficulty education white  i.county i.faminc i.industry i.occ_time  if year<=2019 |year==2020 & month<=7

logit employed female sch_reopen female_reopen age new_cases fully_vacc_rate pernum difficulty education white  i.county i.faminc i.industry i.occ_time if year==2020 & month>=4 | year==2021


logit employed female sch_clo female_clo age new_cases fully_vacc_rate pernum i.industry_time i.county i.faminc i.race i.occupation i.difficulty i.education if year<=2019 |year==2020 & month<=7

logit employed female sch_reopen female_reopen age new_cases fully_vacc_rate pernum i.industry_time i.county i.faminc i.race i.occupation i.difficulty i.education if year==2020 & month>=4 | year==2021

logit employed female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate pernum i.industry_time i.county i.faminc i.race i.occupation i.difficulty i.education

logit employed female sch_clo female_clo age new_cases fully_vacc_rate i.industry_time i.county if year<=2019 |year==2020 & month<=7
outreg2 using sta_CA_seperate_effects_hybrid.doc, replace ctitle(closure only) keep(female sch_clo female_clo age new_cases fully_vacc_rate)

logit employed female sch_reopen female_reopen age new_cases fully_vacc_rate i.industry_time i.county if year==2020 & month>=4 | year==2021
outreg2 using sta_CA_seperate_effects_hybrid.doc, append ctitle(reopen only) keep(female sch_reopen female_reopen age new_cases fully_vacc_rate)

logit employed female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate i.industry_time i.county 
outreg2 using sta_CA_seperate_effects_hybrid.doc, append ctitle(closure+reopen) keep(female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate)

drop if ahrsworkt==999
gen hrsworkmonth=4*ahrsworkt
gen loghrsmonth=log(hrsworkmonth)

drop if employed==0
reg loghrsmonth female sch_clo female_clo age new_cases fully_vacc_rate i.date i.county i.industry if year<=2019 |year==2020 & month<=7
outreg2 using sta_CA_seperate_effects_hybrid.doc, append ctitle(closure only) keep(female sch_clo female_clo age new_cases fully_vacc_rate) 

reg loghrsmonth female sch_reopen female_reopen age new_cases fully_vacc_rate i.date i.county i.industry if year==2020 & month>=4 | year==2021
outreg2 using sta_CA_seperate_effects_hybrid.doc, append ctitle(reopen only) keep(female sch_reopen female_reopen age new_cases fully_vacc_rate) 

reg loghrsmonth female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate i.date i.county i.industry
outreg2 using sta_CA_seperate_effects_hybrid.doc, append ctitle(closure+reopen) keep(female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate)

reg loghrsmonth female sch_clo female_clo age new_cases fully_vacc_rate pernum i.industry_time i.county i.faminc i.race i.occupation i.difficulty i.education if year<=2019 |year==2020 & month<=7

reg loghrsmonth female sch_reopen female_reopen age new_cases fully_vacc_rate pernum i.industry_time i.county i.faminc i.race i.occupation i.difficulty i.education if year==2020 & month>=4 | year==2021

reg loghrsmonth female sch_clo female_clo sch_reopen female_reopen age new_cases fully_vacc_rate pernum i.industry_time i.county i.faminc i.race i.occupation i.difficulty i.education

****************************************************************************************
*Dynamic Model:Event Study-CA County Level
reg employed pre_reopen_12 pre_reopen_11 pre_reopen_10 pre_reopen_9 pre_reopen_8 pre_reopen_7 pre_reopen_6 pre_reopen_5 pre_reopen_4 pre_reopen_3 pre_reopen_2 pre_reopen_1 post_reopen_1 post_reopen_2 post_reopen_3 post_reopen_4 post_reopen_5 post_reopen_6 post_reopen_7 post_reopen_8 post_reopen_9 post_reopen_10 post_reopen_11 post_reopen_12 age new_cases fully_vacc_rate i.industry i.date i.county if female==0

outreg2 using dyn_CA_seperate_effects_hybrid.doc, replace ctitle(Male) keep(pre_reopen_12 pre_reopen_11 pre_reopen_10 pre_reopen_9 pre_reopen_8 pre_reopen_7 pre_reopen_6 pre_reopen_5 pre_reopen_4 pre_reopen_3 pre_reopen_2 pre_reopen_1 post_reopen_1 post_reopen_2 post_reopen_3 post_reopen_4 post_reopen_5 post_reopen_6 post_reopen_7 post_reopen_8 post_reopen_9 post_reopen_10 post_reopen_11 post_reopen_12 age new_cases fully_vacc_rate)

estimates store male

reg employed pre_reopen_12 pre_reopen_11 pre_reopen_10 pre_reopen_9 pre_reopen_8 pre_reopen_7 pre_reopen_6 pre_reopen_5 pre_reopen_4 pre_reopen_3 pre_reopen_2 pre_reopen_1 post_reopen_1 post_reopen_2 post_reopen_3 post_reopen_4 post_reopen_5 post_reopen_6 post_reopen_7 post_reopen_8 post_reopen_9 post_reopen_10 post_reopen_11 post_reopen_12 age new_cases fully_vacc_rate i.industry i.date i.county if female==1

outreg2 using dyn_CA_seperate_effects_hybrid.doc, append ctitle(Female) keep(pre_reopen_12 pre_reopen_11 pre_reopen_10 pre_reopen_9 pre_reopen_8 pre_reopen_7 pre_reopen_6 pre_reopen_5 pre_reopen_4 pre_reopen_3 pre_reopen_2 pre_reopen_1 post_reopen_1 post_reopen_2 post_reopen_3 post_reopen_4 post_reopen_5 post_reopen_6 post_reopen_7 post_reopen_8 post_reopen_9 post_reopen_10 post_reopen_11 post_reopen_12 age new_cases fully_vacc_rate)

estimates store female

*Creating event study graph
forvalues i=1/12 {
	label var pre_reopen_`i' "p`i'"
	label var post_reopen_`i' "a`i'"
}

coefplot (male,label (male)) (female,label (female)), vertical drop(_cons age new_cases fully_vacc_rate  *.industry *.county *.date pre_reopen_12 pre_reopen_11 pre_reopen_10 pre_reopen_9 pre_reopen_8  post_reopen_8 post_reopen_9 post_reopen_10 post_reopen_11 post_reopen_12 ) recast(scatter) ciopt(color(%20)) nooffsets







