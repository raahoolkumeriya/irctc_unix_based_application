#!/bin/bash

#---------------------------------------------------------------------------
#			Train selection script
#	               Thu Nov 10 23:07:57 IST 2016
#---------------------------------------------------------------------------

clear
INVALID_ARG=84
echo ""
echo ""
echo ""
echo "$(tput setaf 1) $(tput bold)"
echo " 		 Train running between the stations"
echo "	========================================================="
echo " 	KATOL		NAGPUR		WARDHA		BADNERA"
echo "		AKOLA		SHEGAON	"
echo "	BHUSAVAL	MANMAD 		NAGAR		KOPARGAON"
echo "				DAUND		PUNE	"
echo "	========================================================="
echo "$(tput sgr0)"

#   -----------------   case for the from station booking
echo -n " Select the Sation from which you want reserve your seat  : "
read from_station_raw

case $from_station_raw in 
	katol|KATOL|KATL) from_station='KATL';;
	nagpur|NAGPUR|NGP) from_station='NGP';;
	wardha|WARDHA|WRD) from_station='WRD';;
	badnera|BADNERA|BRD) from_station='BRD';;
	akola|AKOLA|AKL) from_station='AKL';;
	SHEGAON|shegaon|SHGN) from_station='SHGN';;
	bhusaval|BHUSAVAL|BSL) from_station='BSL';;
	MANMAD|manmad|MND) from_station='MND';;
	nagar|NAGAR|AMNR) from_station='AMNR';;
	kopargaon|KOPARGAON|KPGN) from_station='KPGN';;
	daund|DAUND|DUND) from_station='DUND';;
	pune|PUNE|PUN) from_station='PUN';;
	*)
	echo "please make a proper choice  !!!"
esac


#  -------------------  case for TO station
echo ""
echo ""
echo -n " Select the Station to where you want reservation         : "
read to_station_raw

echo ""
echo ""
case $to_station_raw in 
	katol|KATOL|KATL) to_station='KATL';;
	nagpur|NAGPUR|NGP) to_station='NGP';;
	wardha|WARDHA|WRD) to_station='WRD';;
	badnera|BADNERA|BRD) to_station='BRD';;
	akola|AKOLA|AKL) to_station='AKL';;
	SHEGAON|shegaon|SHGN) to_station='SHGN';;
	bhusaval|BHUSAVAL|BSL) to_station='BSL';;
	MANMAD|manmad|MND) to_station='MND';;
	nagar|NAGAR|AMNR) to_station='AMNR';;
	kopargaon|KOPARGAON|KPGN) to_station='KPGN';;
	daund|DAUND|DUND) to_station='DUND';;
	pune|PUNE|PUN) to_station='PUN';;
	*)
	echo "please make a proper choice  !!!"
esac

#     -----------------             calculaion for date

TODAY=`date +%d`
MONTH=`date +%m`
YEAR=`date +%Y`

echo -n " Enter the date of Journey in DD MM YYYY                  :  " 
read DD MM YYYY 
if [[ "$DD" == "$TODAY" ]] 
	then
		echo "Today's date is not possible for reservation"
	sleep 4
	./`basename $0`
elif [[ "$DD" < "$TODAY" ||  "$MM" < "$MONTH" ]]
	then	
		echo " Back date ticket not possible !! Please try future dates "
	sleep 4
	./`basename $0`
elif [[ "$YYYY" > "$YEAR" ]]
	then 	
		echo "Please enter the current year"
	sleep 4
	./`basename $0`
elif [[ "$MM" > "`expr $MONTH + 4`" ]]
	then 	
		echo " Reservation is valid within the four months only"
	sleep 4
	./`basename $0`
elif [[ "$DD" > 31 && "$MM" > 12 ]]
	then
		echo "Please enter the correct date and Month"
	sleep 4
	./`basename $0`
fi 


BASE=$from_station
CMD=$to_station
echo ""
if [[ "$CMD" == "$BASE" ]]; then
	echo 'You can NOT make reservation from same station to same station'
	echo 'Please check the Destiantion station'
	clear
	echo ""
	./`basename $0`
else
	echo ""
	#  ./route_train.sh 
fi

echo " "
echo " _________________________________________________________"
echo ""								
echo "                $(tput setab 4)You Planned Journey as$(tput sgr0)      "
echo ""   
echo "		From Station    : $from_station "     
echo "" 					
echo "		To Station      : $to_station"
echo ""  				
echo "		Date Of Journey	: $DD $MM $YYYY "   
echo ""
echo "_________________________________________________________"
DOJ=$DD$MM$YYYY
echo " "
echo " "
export from_station
export to_station
export DOJ
echo " "
echo " "
./route_train.sh
#echo "from_station=$from_station" >.station_details
#echo "to_station=$to_station">>.station_details
