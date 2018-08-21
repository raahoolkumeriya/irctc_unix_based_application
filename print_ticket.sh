#!/bin/bash

#--------------------------------------------------------------------
#			Print ticket ESR
#		Sat Nov 12 11:02:51 IST 2016
#--------------------------------------------------------------------


  ./payment.sh
if [[ "$gender" == 'M' || "$gender" == 'm' ]]
	then new_gender='Male'
else
	new_gender='FEMALE'
fi

total_cost=`grep total_cost .fare_details | awk -F "=" '{print $2}'`
total_km=`grep total_km .fare_details | awk -F "=" '{print $2}'`


clear
echo "$(tput setaf 4)
===================================================================================
 ||	  O_o  IRCTCs e-Ticketing ServiceElectronic Reservation Slip   O_o      ||
___________________________________________________________________________________
|	This ticket will only be valid along with an ID proof in original.	  |
|	 If found travelling without ID Proof,Passenger will be treatedas 	  |
| 	without ticket and charged as per extant Railway rules.          	  |
|_________________________________________________________________________________| $(tput sgr0)"
echo "$(tput setaf 6)"

echo "PNR No. :$(tput setab 4)$PNR$(tput sgr0)                          Date of Journey : $DOJ"
echo "Train No: $train_number             	                Train Name   : $train_name"
echo "From    : $from_station                   	          To           : $to_station"
echo "$(tput sgr0)"
function_print()
{

	echo ====================================================================================== 
	echo "NAME               AGE              GENDER             STATUS             BERTH/SEAT"
	echo ======================================================================================= 
	echo -n "$name          "
	echo "$age               $new_gender           $book_status              $book_seat_number"
	echo ======================================================================================= 
	echo "TOTAL FARE : ₹ $(tput setab 4)$total_cost$(tput sgr0)	   				TOTAL KM : $(tput setab 4)$total_km$(tput sgr0) KM"
}
case $train_number in 
	22845)
	function_print
#grep $PNR | awk -F "|"  '
#BEGIN {
#print "----------------------------------------------------------------"
#printf "%-30s %-10s %-20s\n" ,"NAME","AGE","GENDER"
#print "----------------------------------------------------------------"
#}
#NR==1,NR==10 { printf "%-30s %-10d %-20s\n",$3,$4,$5}' pune_hatia_superfast.csv 
#echo "-----------------------------------------------------------------"

	;;

	12113)
	function_print	
	;;
	
	12129)
	function_print
	;;
	
	11039)
	function_print
	;;
	
	*)
	echo "$(tput setaf 1)"
	echo " Please Contact on railway counter"
	echo "$(tput sgr0)"
esac
echo $(tput setaf 5)
	
					    
echo '			(@@@)  (  ) (@@@) ( ) @  @  (  )  @
		   (@@@)
		(   )
 	     (@@@@@)
	   (   )
	   	
         (@@@)
       ===     _______                 ___________
       | |____/       \__I I_____===---|__________|      __________________
   -D--|------\_______/ |  |           | _    _ |        |                 \_____A_
    |(_) |   || | |-----   |           ||_|  |_||      __|___________________     |
   /     |   || |  |-------------------| I----I |     -|                          |
   |     |   || | INDIAN RAILWAY  ==============|      |                         |
   |______|___""____;____"_()[]"""______|       |     |                          |
 |/  |  |-----------I____I [][]  [] D   |-------|--------------------------------|-
_/ - |  |-~~\  /~~\  /~~\   /~~\ ___v___________|________________________________|_
 |/  |__|-  o------o-----o------o|___/~~\__/            |_D__D__D__| |_D__D__D_|
  \_/    \_/   \__/  \__/   \__/     \__/                \_/   \_/    \_/   \_/'
echo $(tput sgr0)
