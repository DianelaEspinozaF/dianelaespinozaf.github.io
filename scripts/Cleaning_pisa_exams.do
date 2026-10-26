	gl route   "G:\Mi unidad\Master_LSE\Git-hub\fellowship_atlantic_council\future_voices"
	gl data    "$route\data"
	gl raw     "$data\raw"
	gl clean   "C:\Users\diane\Dropbox\Master_LSE\Git-hub\DianelaEspinozaF.github.io\assets\charts"
	gl figures "$route\outputs\fig"
	gl tables  "$route\outputs\tables"
	
*********************************************
******* PISA scores dataset *****************
*********************************************
	import excel "$raw\PISA\pisa_2025_chapter2_performance.xlsx", sheet("Table I.B1.2a.33") firstrow clear

	drop in 1/5
	drop in 4/8 
	keep TableIB12a33 B F J N R V Z
	drop in 1/3
	
	rename (TableIB12a33 B F J N R V Z)(country science_below_level_2_pct_2006 science_below_level_2_pct_2009 science_below_level_2_pct_2012 science_below_level_2_pct_2015 science_below_level_2_pct_2018 science_below_level_2_pct_2022 science_below_level_2_pct_2025)
	
	replace country = strtrim(itrim(subinstr(country, "*", "", .)))

gen iso3 = ""

replace iso3 = "ALB" if country == "Albania"
replace iso3 = "ARG" if country == "Argentina"
replace iso3 = "ARM" if country == "Armenia"
replace iso3 = "AUS" if country == "Australia"
replace iso3 = "AUT" if country == "Austria"
replace iso3 = "AZE" if country == "Azerbaijan"
replace iso3 = "BEL" if country == "Belgium"
replace iso3 = "BRA" if country == "Brazil"
replace iso3 = "BRN" if country == "Brunei Darussalam"
replace iso3 = "BGR" if country == "Bulgaria"
replace iso3 = "KHM" if country == "Cambodia"
replace iso3 = "CAN" if country == "Canada"
replace iso3 = "CHL" if country == "Chile"
replace iso3 = "COL" if country == "Colombia"
replace iso3 = "CRI" if country == "Costa Rica"
replace iso3 = "HRV" if country == "Croatia"
replace iso3 = "CYP" if country == "Cyprus"
replace iso3 = "CZE" if country == "Czechia"
replace iso3 = "DNK" if country == "Denmark"
replace iso3 = "DOM" if country == "Dominican Republic"
replace iso3 = "ECU" if country == "Ecuador"
replace iso3 = "SLV" if country == "El Salvador"
replace iso3 = "EST" if country == "Estonia"
replace iso3 = "FIN" if country == "Finland"
replace iso3 = "FRA" if country == "France"
replace iso3 = "GEO" if country == "Georgia"
replace iso3 = "DEU" if country == "Germany"
replace iso3 = "GRC" if country == "Greece"
replace iso3 = "GTM" if country == "Guatemala"
replace iso3 = "HKG" if country == "Hong Kong (China)"
replace iso3 = "HUN" if country == "Hungary"
replace iso3 = "ISL" if country == "Iceland"
replace iso3 = "IDN" if country == "Indonesia"
replace iso3 = "IRL" if country == "Ireland"
replace iso3 = "ISR" if country == "Israel"
replace iso3 = "ITA" if country == "Italy"
replace iso3 = "JPN" if country == "Japan"
replace iso3 = "JOR" if country == "Jordan"
replace iso3 = "KAZ" if country == "Kazakhstan"
replace iso3 = "KEN" if country == "Kenya"
replace iso3 = "KOR" if country == "Korea"
replace iso3 = "KGZ" if country == "Kyrgyzstan"
replace iso3 = "LVA" if country == "Latvia"
replace iso3 = "LBN" if country == "Lebanon"
replace iso3 = "LTU" if country == "Lithuania"
replace iso3 = "LUX" if country == "Luxembourg"
replace iso3 = "MAC" if country == "Macao (China)"
replace iso3 = "MYS" if country == "Malaysia"
replace iso3 = "MLT" if country == "Malta"
replace iso3 = "MUS" if country == "Mauritius"
replace iso3 = "MEX" if country == "Mexico"
replace iso3 = "MDA" if country == "Moldova"
replace iso3 = "MNG" if country == "Mongolia"
replace iso3 = "MNE" if country == "Montenegro"
replace iso3 = "MAR" if country == "Morocco"
replace iso3 = "NLD" if country == "Netherlands"
replace iso3 = "NZL" if country == "New Zealand"
replace iso3 = "MKD" if country == "North Macedonia"
replace iso3 = "NOR" if country == "Norway"
replace iso3 = "PSE" if country == "Palestinian Authority"
replace iso3 = "PRY" if country == "Paraguay"
replace iso3 = "PER" if country == "Peru"
replace iso3 = "PHL" if country == "Philippines"
replace iso3 = "POL" if country == "Poland"
replace iso3 = "PRT" if country == "Portugal"
replace iso3 = "QAT" if country == "Qatar"
replace iso3 = "ROU" if country == "Romania"
replace iso3 = "RWA" if country == "Rwanda"
replace iso3 = "SAU" if country == "Saudi Arabia"
replace iso3 = "SRB" if country == "Serbia"
replace iso3 = "SGP" if country == "Singapore"
replace iso3 = "SVK" if country == "Slovak Republic"
replace iso3 = "SVN" if country == "Slovenia"
replace iso3 = "ESP" if country == "Spain"
replace iso3 = "SWE" if country == "Sweden"
replace iso3 = "CHE" if country == "Switzerland"
replace iso3 = "TWN" if country == "Chinese Taipei"
replace iso3 = "THA" if country == "Thailand"
replace iso3 = "TUR" if country == "Türkiye"
replace iso3 = "ARE" if country == "United Arab Emirates"
replace iso3 = "GBR" if country == "United Kingdom"
replace iso3 = "USA" if country == "United States"
replace iso3 = "URY" if country == "Uruguay"
replace iso3 = "UZB" if country == "Uzbekistan"
replace iso3 = "VNM" if country == "Viet Nam"
replace iso3 = "ZMB" if country == "Zambia"

keep if iso3 != ""

	tempfile science_below_level_2
	save `science_below_level_2'
	
	
	import excel "$raw\PISA\pisa_2025_chapter2_performance.xlsx", sheet("Table I.B1.2a.34") firstrow clear

	drop in 1/5
	drop in 4/8 
	keep TableIB12a34 B F J N R V Z AD AH
	drop in 1/3

	rename (TableIB12a34 B F J N R V Z AD AH)(country reading_below_level_2_pct_2000 reading_below_level_2_pct_2003 reading_below_level_2_pct_2006 reading_below_level_2_pct_2009 reading_below_level_2_pct_2012 reading_below_level_2_pct_2015 reading_below_level_2_pct_2018 reading_below_level_2_pct_2022 reading_below_level_2_pct_2025)
	
	replace country = strtrim(itrim(subinstr(country, "*", "", .)))

gen iso3 = ""

replace iso3 = "ALB" if country == "Albania"
replace iso3 = "ARG" if country == "Argentina"
replace iso3 = "ARM" if country == "Armenia"
replace iso3 = "AUS" if country == "Australia"
replace iso3 = "AUT" if country == "Austria"
replace iso3 = "AZE" if country == "Azerbaijan"
replace iso3 = "BEL" if country == "Belgium"
replace iso3 = "BRA" if country == "Brazil"
replace iso3 = "BRN" if country == "Brunei Darussalam"
replace iso3 = "BGR" if country == "Bulgaria"
replace iso3 = "KHM" if country == "Cambodia"
replace iso3 = "CAN" if country == "Canada"
replace iso3 = "CHL" if country == "Chile"
replace iso3 = "COL" if country == "Colombia"
replace iso3 = "CRI" if country == "Costa Rica"
replace iso3 = "HRV" if country == "Croatia"
replace iso3 = "CYP" if country == "Cyprus"
replace iso3 = "CZE" if country == "Czechia"
replace iso3 = "DNK" if country == "Denmark"
replace iso3 = "DOM" if country == "Dominican Republic"
replace iso3 = "ECU" if country == "Ecuador"
replace iso3 = "SLV" if country == "El Salvador"
replace iso3 = "EST" if country == "Estonia"
replace iso3 = "FIN" if country == "Finland"
replace iso3 = "FRA" if country == "France"
replace iso3 = "GEO" if country == "Georgia"
replace iso3 = "DEU" if country == "Germany"
replace iso3 = "GRC" if country == "Greece"
replace iso3 = "GTM" if country == "Guatemala"
replace iso3 = "HKG" if country == "Hong Kong (China)"
replace iso3 = "HUN" if country == "Hungary"
replace iso3 = "ISL" if country == "Iceland"
replace iso3 = "IDN" if country == "Indonesia"
replace iso3 = "IRL" if country == "Ireland"
replace iso3 = "ISR" if country == "Israel"
replace iso3 = "ITA" if country == "Italy"
replace iso3 = "JPN" if country == "Japan"
replace iso3 = "JOR" if country == "Jordan"
replace iso3 = "KAZ" if country == "Kazakhstan"
replace iso3 = "KEN" if country == "Kenya"
replace iso3 = "KOR" if country == "Korea"
replace iso3 = "KGZ" if country == "Kyrgyzstan"
replace iso3 = "LVA" if country == "Latvia"
replace iso3 = "LBN" if country == "Lebanon"
replace iso3 = "LTU" if country == "Lithuania"
replace iso3 = "LUX" if country == "Luxembourg"
replace iso3 = "MAC" if country == "Macao (China)"
replace iso3 = "MYS" if country == "Malaysia"
replace iso3 = "MLT" if country == "Malta"
replace iso3 = "MUS" if country == "Mauritius"
replace iso3 = "MEX" if country == "Mexico"
replace iso3 = "MDA" if country == "Moldova"
replace iso3 = "MNG" if country == "Mongolia"
replace iso3 = "MNE" if country == "Montenegro"
replace iso3 = "MAR" if country == "Morocco"
replace iso3 = "NLD" if country == "Netherlands"
replace iso3 = "NZL" if country == "New Zealand"
replace iso3 = "MKD" if country == "North Macedonia"
replace iso3 = "NOR" if country == "Norway"
replace iso3 = "PSE" if country == "Palestinian Authority"
replace iso3 = "PRY" if country == "Paraguay"
replace iso3 = "PER" if country == "Peru"
replace iso3 = "PHL" if country == "Philippines"
replace iso3 = "POL" if country == "Poland"
replace iso3 = "PRT" if country == "Portugal"
replace iso3 = "QAT" if country == "Qatar"
replace iso3 = "ROU" if country == "Romania"
replace iso3 = "RWA" if country == "Rwanda"
replace iso3 = "SAU" if country == "Saudi Arabia"
replace iso3 = "SRB" if country == "Serbia"
replace iso3 = "SGP" if country == "Singapore"
replace iso3 = "SVK" if country == "Slovak Republic"
replace iso3 = "SVN" if country == "Slovenia"
replace iso3 = "ESP" if country == "Spain"
replace iso3 = "SWE" if country == "Sweden"
replace iso3 = "CHE" if country == "Switzerland"
replace iso3 = "TWN" if country == "Chinese Taipei"
replace iso3 = "THA" if country == "Thailand"
replace iso3 = "TUR" if country == "Türkiye"
replace iso3 = "ARE" if country == "United Arab Emirates"
replace iso3 = "GBR" if country == "United Kingdom"
replace iso3 = "USA" if country == "United States"
replace iso3 = "URY" if country == "Uruguay"
replace iso3 = "UZB" if country == "Uzbekistan"
replace iso3 = "VNM" if country == "Viet Nam"
replace iso3 = "ZMB" if country == "Zambia"

keep if iso3 != ""
	
	tempfile reading_below_level_2
	save `reading_below_level_2'
	
	
	import excel "$raw\PISA\pisa_2025_chapter2_performance.xlsx", sheet("Table I.B1.2a.35") firstrow clear

	drop in 1/5
	drop in 4/8 
	keep TableIB12a35 B F J N R V Z AD
	drop in 1/3

	rename (TableIB12a35 B F J N R V Z AD)(country math_below_level_2_pct_2003 math_below_level_2_pct_2006 math_below_level_2_pct_2009 math_below_level_2_pct_2012 math_below_level_2_pct_2015 math_below_level_2_pct_2018 math_below_level_2_pct_2022 math_below_level_2_pct_2025)
	
	replace country = strtrim(itrim(subinstr(country, "*", "", .)))

gen iso3 = ""

replace iso3 = "ALB" if country == "Albania"
replace iso3 = "ARG" if country == "Argentina"
replace iso3 = "ARM" if country == "Armenia"
replace iso3 = "AUS" if country == "Australia"
replace iso3 = "AUT" if country == "Austria"
replace iso3 = "AZE" if country == "Azerbaijan"
replace iso3 = "BEL" if country == "Belgium"
replace iso3 = "BRA" if country == "Brazil"
replace iso3 = "BRN" if country == "Brunei Darussalam"
replace iso3 = "BGR" if country == "Bulgaria"
replace iso3 = "KHM" if country == "Cambodia"
replace iso3 = "CAN" if country == "Canada"
replace iso3 = "CHL" if country == "Chile"
replace iso3 = "COL" if country == "Colombia"
replace iso3 = "CRI" if country == "Costa Rica"
replace iso3 = "HRV" if country == "Croatia"
replace iso3 = "CYP" if country == "Cyprus"
replace iso3 = "CZE" if country == "Czechia"
replace iso3 = "DNK" if country == "Denmark"
replace iso3 = "DOM" if country == "Dominican Republic"
replace iso3 = "ECU" if country == "Ecuador"
replace iso3 = "SLV" if country == "El Salvador"
replace iso3 = "EST" if country == "Estonia"
replace iso3 = "FIN" if country == "Finland"
replace iso3 = "FRA" if country == "France"
replace iso3 = "GEO" if country == "Georgia"
replace iso3 = "DEU" if country == "Germany"
replace iso3 = "GRC" if country == "Greece"
replace iso3 = "GTM" if country == "Guatemala"
replace iso3 = "HKG" if country == "Hong Kong (China)"
replace iso3 = "HUN" if country == "Hungary"
replace iso3 = "ISL" if country == "Iceland"
replace iso3 = "IDN" if country == "Indonesia"
replace iso3 = "IRL" if country == "Ireland"
replace iso3 = "ISR" if country == "Israel"
replace iso3 = "ITA" if country == "Italy"
replace iso3 = "JPN" if country == "Japan"
replace iso3 = "JOR" if country == "Jordan"
replace iso3 = "KAZ" if country == "Kazakhstan"
replace iso3 = "KEN" if country == "Kenya"
replace iso3 = "KOR" if country == "Korea"
replace iso3 = "KGZ" if country == "Kyrgyzstan"
replace iso3 = "LVA" if country == "Latvia"
replace iso3 = "LBN" if country == "Lebanon"
replace iso3 = "LTU" if country == "Lithuania"
replace iso3 = "LUX" if country == "Luxembourg"
replace iso3 = "MAC" if country == "Macao (China)"
replace iso3 = "MYS" if country == "Malaysia"
replace iso3 = "MLT" if country == "Malta"
replace iso3 = "MUS" if country == "Mauritius"
replace iso3 = "MEX" if country == "Mexico"
replace iso3 = "MDA" if country == "Moldova"
replace iso3 = "MNG" if country == "Mongolia"
replace iso3 = "MNE" if country == "Montenegro"
replace iso3 = "MAR" if country == "Morocco"
replace iso3 = "NLD" if country == "Netherlands"
replace iso3 = "NZL" if country == "New Zealand"
replace iso3 = "MKD" if country == "North Macedonia"
replace iso3 = "NOR" if country == "Norway"
replace iso3 = "PSE" if country == "Palestinian Authority"
replace iso3 = "PRY" if country == "Paraguay"
replace iso3 = "PER" if country == "Peru"
replace iso3 = "PHL" if country == "Philippines"
replace iso3 = "POL" if country == "Poland"
replace iso3 = "PRT" if country == "Portugal"
replace iso3 = "QAT" if country == "Qatar"
replace iso3 = "ROU" if country == "Romania"
replace iso3 = "RWA" if country == "Rwanda"
replace iso3 = "SAU" if country == "Saudi Arabia"
replace iso3 = "SRB" if country == "Serbia"
replace iso3 = "SGP" if country == "Singapore"
replace iso3 = "SVK" if country == "Slovak Republic"
replace iso3 = "SVN" if country == "Slovenia"
replace iso3 = "ESP" if country == "Spain"
replace iso3 = "SWE" if country == "Sweden"
replace iso3 = "CHE" if country == "Switzerland"
replace iso3 = "TWN" if country == "Chinese Taipei"
replace iso3 = "THA" if country == "Thailand"
replace iso3 = "TUR" if country == "Türkiye"
replace iso3 = "ARE" if country == "United Arab Emirates"
replace iso3 = "GBR" if country == "United Kingdom"
replace iso3 = "USA" if country == "United States"
replace iso3 = "URY" if country == "Uruguay"
replace iso3 = "UZB" if country == "Uzbekistan"
replace iso3 = "VNM" if country == "Viet Nam"
replace iso3 = "ZMB" if country == "Zambia"

keep if iso3 != ""
	
	tempfile math_below_level_2
	save `math_below_level_2'
	
	
	
	import excel "$raw\PISA\pisa_2025_chapter2_performance.xlsx", sheet("Table I.B1.2a.36") firstrow clear

	drop in 1/5
	drop in 4/8 
	keep TableIB12a36 B D F H J L N
	drop in 1/3

	rename (TableIB12a36 B D F H J L N)(country science_mean_score_2006 science_mean_score_2009 science_mean_score_2012 science_mean_score_2015 science_mean_score_2018 science_mean_score_2022 science_mean_score_2025)
	
	replace country = strtrim(itrim(subinstr(country, "*", "", .)))

gen iso3 = ""

replace iso3 = "ALB" if country == "Albania"
replace iso3 = "ARG" if country == "Argentina"
replace iso3 = "ARM" if country == "Armenia"
replace iso3 = "AUS" if country == "Australia"
replace iso3 = "AUT" if country == "Austria"
replace iso3 = "AZE" if country == "Azerbaijan"
replace iso3 = "BEL" if country == "Belgium"
replace iso3 = "BRA" if country == "Brazil"
replace iso3 = "BRN" if country == "Brunei Darussalam"
replace iso3 = "BGR" if country == "Bulgaria"
replace iso3 = "KHM" if country == "Cambodia"
replace iso3 = "CAN" if country == "Canada"
replace iso3 = "CHL" if country == "Chile"
replace iso3 = "COL" if country == "Colombia"
replace iso3 = "CRI" if country == "Costa Rica"
replace iso3 = "HRV" if country == "Croatia"
replace iso3 = "CYP" if country == "Cyprus"
replace iso3 = "CZE" if country == "Czechia"
replace iso3 = "DNK" if country == "Denmark"
replace iso3 = "DOM" if country == "Dominican Republic"
replace iso3 = "ECU" if country == "Ecuador"
replace iso3 = "SLV" if country == "El Salvador"
replace iso3 = "EST" if country == "Estonia"
replace iso3 = "FIN" if country == "Finland"
replace iso3 = "FRA" if country == "France"
replace iso3 = "GEO" if country == "Georgia"
replace iso3 = "DEU" if country == "Germany"
replace iso3 = "GRC" if country == "Greece"
replace iso3 = "GTM" if country == "Guatemala"
replace iso3 = "HKG" if country == "Hong Kong (China)"
replace iso3 = "HUN" if country == "Hungary"
replace iso3 = "ISL" if country == "Iceland"
replace iso3 = "IDN" if country == "Indonesia"
replace iso3 = "IRL" if country == "Ireland"
replace iso3 = "ISR" if country == "Israel"
replace iso3 = "ITA" if country == "Italy"
replace iso3 = "JPN" if country == "Japan"
replace iso3 = "JOR" if country == "Jordan"
replace iso3 = "KAZ" if country == "Kazakhstan"
replace iso3 = "KEN" if country == "Kenya"
replace iso3 = "KOR" if country == "Korea"
replace iso3 = "KGZ" if country == "Kyrgyzstan"
replace iso3 = "LVA" if country == "Latvia"
replace iso3 = "LBN" if country == "Lebanon"
replace iso3 = "LTU" if country == "Lithuania"
replace iso3 = "LUX" if country == "Luxembourg"
replace iso3 = "MAC" if country == "Macao (China)"
replace iso3 = "MYS" if country == "Malaysia"
replace iso3 = "MLT" if country == "Malta"
replace iso3 = "MUS" if country == "Mauritius"
replace iso3 = "MEX" if country == "Mexico"
replace iso3 = "MDA" if country == "Moldova"
replace iso3 = "MNG" if country == "Mongolia"
replace iso3 = "MNE" if country == "Montenegro"
replace iso3 = "MAR" if country == "Morocco"
replace iso3 = "NLD" if country == "Netherlands"
replace iso3 = "NZL" if country == "New Zealand"
replace iso3 = "MKD" if country == "North Macedonia"
replace iso3 = "NOR" if country == "Norway"
replace iso3 = "PSE" if country == "Palestinian Authority"
replace iso3 = "PRY" if country == "Paraguay"
replace iso3 = "PER" if country == "Peru"
replace iso3 = "PHL" if country == "Philippines"
replace iso3 = "POL" if country == "Poland"
replace iso3 = "PRT" if country == "Portugal"
replace iso3 = "QAT" if country == "Qatar"
replace iso3 = "ROU" if country == "Romania"
replace iso3 = "RWA" if country == "Rwanda"
replace iso3 = "SAU" if country == "Saudi Arabia"
replace iso3 = "SRB" if country == "Serbia"
replace iso3 = "SGP" if country == "Singapore"
replace iso3 = "SVK" if country == "Slovak Republic"
replace iso3 = "SVN" if country == "Slovenia"
replace iso3 = "ESP" if country == "Spain"
replace iso3 = "SWE" if country == "Sweden"
replace iso3 = "CHE" if country == "Switzerland"
replace iso3 = "TWN" if country == "Chinese Taipei"
replace iso3 = "THA" if country == "Thailand"
replace iso3 = "TUR" if country == "Türkiye"
replace iso3 = "ARE" if country == "United Arab Emirates"
replace iso3 = "GBR" if country == "United Kingdom"
replace iso3 = "USA" if country == "United States"
replace iso3 = "URY" if country == "Uruguay"
replace iso3 = "UZB" if country == "Uzbekistan"
replace iso3 = "VNM" if country == "Viet Nam"
replace iso3 = "ZMB" if country == "Zambia"

keep if iso3 != ""
	
	tempfile science_mean_score
	save `science_mean_score'
	

	import excel "$raw\PISA\pisa_2025_chapter2_performance.xlsx", sheet("Table I.B1.2a.37") firstrow clear

	drop in 1/5
	drop in 4/8 
	keep TableIB12a37 B D F H J L N P R
	drop in 1/3

	rename (TableIB12a37 B D F H J L N P R)(country reading_mean_score_2000 reading_mean_score_2003 reading_mean_score_2006 reading_mean_score_2009 reading_mean_score_2012 reading_mean_score_2015 reading_mean_score_2018 reading_mean_score_2022 reading_mean_score_2025)
	
	replace country = strtrim(itrim(subinstr(country, "*", "", .)))

gen iso3 = ""

replace iso3 = "ALB" if country == "Albania"
replace iso3 = "ARG" if country == "Argentina"
replace iso3 = "ARM" if country == "Armenia"
replace iso3 = "AUS" if country == "Australia"
replace iso3 = "AUT" if country == "Austria"
replace iso3 = "AZE" if country == "Azerbaijan"
replace iso3 = "BEL" if country == "Belgium"
replace iso3 = "BRA" if country == "Brazil"
replace iso3 = "BRN" if country == "Brunei Darussalam"
replace iso3 = "BGR" if country == "Bulgaria"
replace iso3 = "KHM" if country == "Cambodia"
replace iso3 = "CAN" if country == "Canada"
replace iso3 = "CHL" if country == "Chile"
replace iso3 = "COL" if country == "Colombia"
replace iso3 = "CRI" if country == "Costa Rica"
replace iso3 = "HRV" if country == "Croatia"
replace iso3 = "CYP" if country == "Cyprus"
replace iso3 = "CZE" if country == "Czechia"
replace iso3 = "DNK" if country == "Denmark"
replace iso3 = "DOM" if country == "Dominican Republic"
replace iso3 = "ECU" if country == "Ecuador"
replace iso3 = "SLV" if country == "El Salvador"
replace iso3 = "EST" if country == "Estonia"
replace iso3 = "FIN" if country == "Finland"
replace iso3 = "FRA" if country == "France"
replace iso3 = "GEO" if country == "Georgia"
replace iso3 = "DEU" if country == "Germany"
replace iso3 = "GRC" if country == "Greece"
replace iso3 = "GTM" if country == "Guatemala"
replace iso3 = "HKG" if country == "Hong Kong (China)"
replace iso3 = "HUN" if country == "Hungary"
replace iso3 = "ISL" if country == "Iceland"
replace iso3 = "IDN" if country == "Indonesia"
replace iso3 = "IRL" if country == "Ireland"
replace iso3 = "ISR" if country == "Israel"
replace iso3 = "ITA" if country == "Italy"
replace iso3 = "JPN" if country == "Japan"
replace iso3 = "JOR" if country == "Jordan"
replace iso3 = "KAZ" if country == "Kazakhstan"
replace iso3 = "KEN" if country == "Kenya"
replace iso3 = "KOR" if country == "Korea"
replace iso3 = "KGZ" if country == "Kyrgyzstan"
replace iso3 = "LVA" if country == "Latvia"
replace iso3 = "LBN" if country == "Lebanon"
replace iso3 = "LTU" if country == "Lithuania"
replace iso3 = "LUX" if country == "Luxembourg"
replace iso3 = "MAC" if country == "Macao (China)"
replace iso3 = "MYS" if country == "Malaysia"
replace iso3 = "MLT" if country == "Malta"
replace iso3 = "MUS" if country == "Mauritius"
replace iso3 = "MEX" if country == "Mexico"
replace iso3 = "MDA" if country == "Moldova"
replace iso3 = "MNG" if country == "Mongolia"
replace iso3 = "MNE" if country == "Montenegro"
replace iso3 = "MAR" if country == "Morocco"
replace iso3 = "NLD" if country == "Netherlands"
replace iso3 = "NZL" if country == "New Zealand"
replace iso3 = "MKD" if country == "North Macedonia"
replace iso3 = "NOR" if country == "Norway"
replace iso3 = "PSE" if country == "Palestinian Authority"
replace iso3 = "PRY" if country == "Paraguay"
replace iso3 = "PER" if country == "Peru"
replace iso3 = "PHL" if country == "Philippines"
replace iso3 = "POL" if country == "Poland"
replace iso3 = "PRT" if country == "Portugal"
replace iso3 = "QAT" if country == "Qatar"
replace iso3 = "ROU" if country == "Romania"
replace iso3 = "RWA" if country == "Rwanda"
replace iso3 = "SAU" if country == "Saudi Arabia"
replace iso3 = "SRB" if country == "Serbia"
replace iso3 = "SGP" if country == "Singapore"
replace iso3 = "SVK" if country == "Slovak Republic"
replace iso3 = "SVN" if country == "Slovenia"
replace iso3 = "ESP" if country == "Spain"
replace iso3 = "SWE" if country == "Sweden"
replace iso3 = "CHE" if country == "Switzerland"
replace iso3 = "TWN" if country == "Chinese Taipei"
replace iso3 = "THA" if country == "Thailand"
replace iso3 = "TUR" if country == "Türkiye"
replace iso3 = "ARE" if country == "United Arab Emirates"
replace iso3 = "GBR" if country == "United Kingdom"
replace iso3 = "USA" if country == "United States"
replace iso3 = "URY" if country == "Uruguay"
replace iso3 = "UZB" if country == "Uzbekistan"
replace iso3 = "VNM" if country == "Viet Nam"
replace iso3 = "ZMB" if country == "Zambia"

keep if iso3 != ""
	
	tempfile reading_mean_score
	save `reading_mean_score'
	

	import excel "$raw\PISA\pisa_2025_chapter2_performance.xlsx", sheet("Table I.B1.2a.38") firstrow clear

	drop in 1/5
	drop in 4/8 
	keep TableIB12a38 B D F H J L N P
	drop in 1/3

	rename (TableIB12a38 B D F H J L N P)(country math_mean_score_2003 math_mean_score_2006 math_mean_score_2009 math_mean_score_2012 math_mean_score_2015 math_mean_score_2018 math_mean_score_2022 math_mean_score_2025)
	
	replace country = strtrim(itrim(subinstr(country, "*", "", .)))

gen iso3 = ""

replace iso3 = "ALB" if country == "Albania"
replace iso3 = "ARG" if country == "Argentina"
replace iso3 = "ARM" if country == "Armenia"
replace iso3 = "AUS" if country == "Australia"
replace iso3 = "AUT" if country == "Austria"
replace iso3 = "AZE" if country == "Azerbaijan"
replace iso3 = "BEL" if country == "Belgium"
replace iso3 = "BRA" if country == "Brazil"
replace iso3 = "BRN" if country == "Brunei Darussalam"
replace iso3 = "BGR" if country == "Bulgaria"
replace iso3 = "KHM" if country == "Cambodia"
replace iso3 = "CAN" if country == "Canada"
replace iso3 = "CHL" if country == "Chile"
replace iso3 = "COL" if country == "Colombia"
replace iso3 = "CRI" if country == "Costa Rica"
replace iso3 = "HRV" if country == "Croatia"
replace iso3 = "CYP" if country == "Cyprus"
replace iso3 = "CZE" if country == "Czechia"
replace iso3 = "DNK" if country == "Denmark"
replace iso3 = "DOM" if country == "Dominican Republic"
replace iso3 = "ECU" if country == "Ecuador"
replace iso3 = "SLV" if country == "El Salvador"
replace iso3 = "EST" if country == "Estonia"
replace iso3 = "FIN" if country == "Finland"
replace iso3 = "FRA" if country == "France"
replace iso3 = "GEO" if country == "Georgia"
replace iso3 = "DEU" if country == "Germany"
replace iso3 = "GRC" if country == "Greece"
replace iso3 = "GTM" if country == "Guatemala"
replace iso3 = "HKG" if country == "Hong Kong (China)"
replace iso3 = "HUN" if country == "Hungary"
replace iso3 = "ISL" if country == "Iceland"
replace iso3 = "IDN" if country == "Indonesia"
replace iso3 = "IRL" if country == "Ireland"
replace iso3 = "ISR" if country == "Israel"
replace iso3 = "ITA" if country == "Italy"
replace iso3 = "JPN" if country == "Japan"
replace iso3 = "JOR" if country == "Jordan"
replace iso3 = "KAZ" if country == "Kazakhstan"
replace iso3 = "KEN" if country == "Kenya"
replace iso3 = "KOR" if country == "Korea"
replace iso3 = "KGZ" if country == "Kyrgyzstan"
replace iso3 = "LVA" if country == "Latvia"
replace iso3 = "LBN" if country == "Lebanon"
replace iso3 = "LTU" if country == "Lithuania"
replace iso3 = "LUX" if country == "Luxembourg"
replace iso3 = "MAC" if country == "Macao (China)"
replace iso3 = "MYS" if country == "Malaysia"
replace iso3 = "MLT" if country == "Malta"
replace iso3 = "MUS" if country == "Mauritius"
replace iso3 = "MEX" if country == "Mexico"
replace iso3 = "MDA" if country == "Moldova"
replace iso3 = "MNG" if country == "Mongolia"
replace iso3 = "MNE" if country == "Montenegro"
replace iso3 = "MAR" if country == "Morocco"
replace iso3 = "NLD" if country == "Netherlands"
replace iso3 = "NZL" if country == "New Zealand"
replace iso3 = "MKD" if country == "North Macedonia"
replace iso3 = "NOR" if country == "Norway"
replace iso3 = "PSE" if country == "Palestinian Authority"
replace iso3 = "PRY" if country == "Paraguay"
replace iso3 = "PER" if country == "Peru"
replace iso3 = "PHL" if country == "Philippines"
replace iso3 = "POL" if country == "Poland"
replace iso3 = "PRT" if country == "Portugal"
replace iso3 = "QAT" if country == "Qatar"
replace iso3 = "ROU" if country == "Romania"
replace iso3 = "RWA" if country == "Rwanda"
replace iso3 = "SAU" if country == "Saudi Arabia"
replace iso3 = "SRB" if country == "Serbia"
replace iso3 = "SGP" if country == "Singapore"
replace iso3 = "SVK" if country == "Slovak Republic"
replace iso3 = "SVN" if country == "Slovenia"
replace iso3 = "ESP" if country == "Spain"
replace iso3 = "SWE" if country == "Sweden"
replace iso3 = "CHE" if country == "Switzerland"
replace iso3 = "TWN" if country == "Chinese Taipei"
replace iso3 = "THA" if country == "Thailand"
replace iso3 = "TUR" if country == "Türkiye"
replace iso3 = "ARE" if country == "United Arab Emirates"
replace iso3 = "GBR" if country == "United Kingdom"
replace iso3 = "USA" if country == "United States"
replace iso3 = "URY" if country == "Uruguay"
replace iso3 = "UZB" if country == "Uzbekistan"
replace iso3 = "VNM" if country == "Viet Nam"
replace iso3 = "ZMB" if country == "Zambia"

keep if iso3 != ""
	
	tempfile math_mean_score
	save `math_mean_score'

	
	use 				 `science_below_level_2', clear
	merge 1:1 iso3 using `reading_below_level_2', keep(3) nogen
	merge 1:1 iso3 using `math_below_level_2', keep(3) nogen
	merge 1:1 iso3 using `science_mean_score', keep(3) nogen
	merge 1:1 iso3 using `reading_mean_score', keep(3) nogen
	merge 1:1 iso3 using `math_mean_score', keep(3) nogen
	
	reshape long science_below_level_2_pct_ reading_below_level_2_pct_ math_below_level_2_pct_ science_mean_score_ reading_mean_score_ math_mean_score_, i(iso3) j(year)
	
	order iso3 country year math_mean_score_ math_below_level_2_pct_ reading_mean_score_ reading_below_level_2_pct_ science_mean_score_ science_below_level_2_pct_
	rename (math_mean_score_ math_below_level_2_pct_ reading_mean_score_ reading_below_level_2_pct_ science_mean_score_ science_below_level_2_pct_) (mathematics_mean_score mathematics_below_level_2_pct reading_mean_score reading_below_level_2_pct science_mean_score science_below_level_2_pct)
	drop country
	*drop if year ==2006 // I will not use this year for the analysis.
	
	local vars science_below_level_2_pct science_mean_score reading_below_level_2_pct reading_mean_score mathematics_below_level_2_pct mathematics_mean_score
	
	foreach v of local vars {
    replace `v'="." if `v'=="m"
	destring `v', replace
}


export delimited using ///
    "$clean\pisa_final_data.csv", replace
	
