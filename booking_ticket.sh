#!/bin/bash
#--------------------------------------------------------------------------------
#               this script use for booking the customer details
#                       Fri Nov 11 02:01:13 IST 2016
#-------------------------------------------------------------------------------

#from_station='pune'
#to_station='katol'
#DOJ=12112016
#train_number=22845
generate_number=`date +%N`
#. ./journey_plan.sh
#echo $from_station
#echo $to_station
#echo $DOJ
#. ./route_train.sh
#echo $train_number

#echo -n "Enter train number		: "
#read train_number
export train_number
export train_name
echo ""
echo -n "Enter the Class 2A 3A SL	: "
read class_select
echo ""
echo -n "Enter your name  		: "
read name
export name
echo ""
echo -n "Enter your Age  		: "
read age
export age
echo ""
echo -n "Enter your Gender (M/F) 	: "
read gender
echo "train_number=$train_number">.station_details
echo "class_select=$class_select">>.station_details
echo "from_station=$from_station">>.station_details
echo "to_station=$to_station">>.station_details
export gender
function_captcha()
{
echo ""
denominations="Agra
mumbai
nagpur
kanpur
goa
ajmer
delhi
katol
trivendrum
bhopal
sikkim
JOCKER
QUEEN
KING
ACE"
        echo ""

        denomination=($denominations)
#       echo $denomination

        num_denomination=${#denomination[*]}
#       echo $num_denomination
        a="${denomination[$((RANDOM%num_denomination))]}"
#        banner $a
echo ""
	echo "..::  O_o	      $a           O_o  ::.."
echo ""
}

#--------------------------------------------- Function for ticket book and status for other trains -------------

function_book_status()
{
declare -a book_array

while read line
        do
        book_array[$i]="$line"
        i=$((i+1))
done <$1

echo ${book_array[1]}
echo ${#book_array[*]}

                        #        while read line; do
                                length=`cat $2 | wc -l`
                                echo $length
                                BASE=${#book_array[*]}
                              #  if [[ "$length" <= "${#book_array[*]}" ]]
                                if [[ "$length" -lt "$BASE" ]]; then
                                        j=`cat $2 | wc -l`
                                        i=$((j-1))
                                                book_seat_number=${book_array[i]}
                                                book_status="CONFIRM"
                                               echo seat number $book_seat_number
                                                echo $book_status
                                                 echo "Your ticket has been book sucessfully"

                                elif [[ "$length" -gt "${#book_array[*]}" ]]
                                then
                                        i=`cat $2 | wc -l`
                                		book_seat_number="WL $i"
				                book_status="WAITING"
                                                i=$((i+1))

                                else
                                        echo "Please check the status"
                                fi
}


#---------------------------------------------
case $train_number in
        22845)  train_name='PUNE HATIA SUP PUNE'

		function_captcha
		echo -n "Enter the capcha and click ENTER to BOOK your ticket "
		read book_capcha
		if [[ "$a" == "$book_capcha"  ]]
        	then
		export PNR=$generate_number
       		echo "$PNR|$class_select|$name|$age|$gender|$from_station|$to_station|$train_number">>pune_hatia_superfast.csv
#----------------------------------------
		if [[ "$class_select" == "2A" ]]
			then
		./other_train_algorithm.sh 2A>other_train_booked_database.csv 
		function_book_status other_train_booked_database.csv pune_hatia_superfast.csv

		#echo Usages: < script_name> other_train_booked_database.csv azad_hind_express.csv

		elif [[ "$class_select" == "3A" ]]
		then
		./other_train_algorithm.sh 3A >other_train_booked_database.csv
		function_book_status other_train_booked_database.csv pune_hatia_superfast.csv


		elif [[ "$class_select" == "SL" ]]
		then
		./other_train_algorithm.sh SL >other_train_booked_database.csv
		function_book_status other_train_booked_database.csv pune_hatia_superfast.csv

		else
		echo "Something went wrong!!!! Please contact query bouth"
		fi

#---------------------------------------
        	echo "Your ticket has been book sucessfully"
			export book_seat_number
			export book_status  
            		
#		./payment.sh
              	./print_ticket.sh
        	else
        	echo "Please try again"
		fi
	;;
     
	12113)  train_name='NAGPUR GARIBRATH'  
        
		function_captcha
                echo -n "Enter the captcha and click ENTER to BOOK your ticket "
                read book_captcha
                if [[ "$a" == "$book_captcha"  ]]
                then
                export PNR=$generate_number
			if [[ "$class_select" == "3A" ]]
                	then
			echo "$PNR|3A|$name|$age|$gender|$from_station|$to_station|$train_number">>garibrath.csv
#-------------------------------------------------------------

			./garibrath_algorithm.sh >garibrath_booked_database.csv

	declare -a book_array

	while read line
        	do
        	book_array[$i]="$line"
      	  i=$((i+1))
	done <garibrath_booked_database.csv
#	echo ${book_array[1]}
#	echo ${#book_array[*]}

                        #        while read line; do
                                length=`cat garibrath.csv| wc -l`
                                echo $length
                                BASE=${#book_array[*]}
                              #  if [[ "$length" <= "${#book_array[*]}" ]]
                                if [[ "$length" -lt "$BASE" ]]; then
                                        j=`cat garibrath.csv | wc -l`
                                        i=$((j-1))
                                                book_seat_number=${book_array[i]}
                                                book_status="CONFIRM"
                                               echo seat number $book_seat_number
                                                echo $book_status
                                                 echo "Your ticket has been book sucessfully"

                                elif [[ "$length" > "${#book_array[*]}" ]]
                                then
						i=`cat garibrath.csv| wc -l`
                                                book_seat_number="WL $i"
                                                book_status="WAITING"
                                                i=$((i+1))


                                else
                                        echo "Please check the status"
                                fi

#----------------------------------------------------------------
			export book_seat_number
			export book_status              		
#				./payment.sh
				./print_ticket.sh
                	else
			echo "No seat of 2A and SL are in tarin GaribRath"
			echo "Please try again"
			fi
		else
                echo "Please try again"
                fi

	;;

        12129)  train_name='AZAD HIND EXP   PUNE' 
		function_captcha
                echo -n "Enter the capcha and click ENTER to BOOK your ticket "
                read book_capcha
                if [[ "$a" == "$book_capcha"  ]]
                then
                export PNR=$generate_number
                echo "$PNR|$class_select|$name|$age|$gender|$from_station|$to_station|$train_number">>azad_hind_express.csv
 #----------------------------------------------------
if [[ "$class_select" == "2A" ]]
then
./other_train_algorithm.sh 2A>other_train_booked_database.csv
function_book_status other_train_booked_database.csv azad_hind_express.csv

echo Usages: < script_name> other_train_booked_database.csv azad_hind_express.csv

elif [[ "$class_select" == "3A" ]]
then
./other_train_algorithm.sh 3A >other_train_booked_database.csv
function_book_status other_train_booked_database.csv azad_hind_express.csv


elif [[ "$class_select" == "SL" ]]
then
./other_train_algorithm.sh SL >other_train_booked_database.csv
function_book_status other_train_booked_database.csv azad_hind_express.csv

else
echo "Something went wrong!!!! Please contact query bouth"
fi


#-----------------------------------------------------          


		     echo "Your ticket has been book sucessfully"
			export book_seat_number
			export book_status              		
#		./payment.sh
              	./print_ticket.sh
                else
                echo "Please try again"
                fi
	;;
        11039)  train_name='MAHARASHTRA EXP'

		 function_captcha
                echo -n "Enter the capcha and click ENTER to BOOK your ticket "
                read book_capcha
                if [[ "$a" == "$book_capcha"  ]]
                then
                export PNR=$generate_number
		echo "$PNR|$class_select|$name|$age|$gender|$from_station|$to_station|$train_number">>maharashtra_express.csv

#-----------------------------------------------------------

if [[ "$class_select" == "2A" ]]
then
./other_train_algorithm.sh 2A>other_train_booked_database.csv
function_book_status other_train_booked_database.csv maharashtra_express.csv 

#echo Usages: < script_name> other_train_booked_database.csv azad_hind_express.csv

elif [[ "$class_select" == "3A" ]]
then
./other_train_algorithm.sh 3A >other_train_booked_database.csv
function_book_status other_train_booked_database.csv maharashtra_express.csv


elif [[ "$class_select" == "SL" ]]
then
./other_train_algorithm.sh SL >other_train_booked_database.csv
function_book_status other_train_booked_database.csv maharashtra_express.csv

else
echo "Something went wrong!!!! Please contact query bouth"
fi


#-----------------------------------------------------------
                echo "Your ticket has been book sucessfully"
			export book_seat_number
			export book_status              		
#		./payment.sh
              	./print_ticket.sh
		else
                echo "Please try again"
                fi

	 ;;

        *)      echo "Something went wrong"
esac



export train_number
export train_name
export PNR
export name
export age
export gender

