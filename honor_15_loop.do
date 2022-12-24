cd "/Users/apple/Desktop"
use "/Users/apple/Desktop/honor_CA_05.dta", clear

*Alameda:reopen at 2021 Feb
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
mean pre_reopen_1
mean pre_reopen_3

mean post_reopen_9
mean post_reopen_11

