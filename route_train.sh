#-------------------------------------------------------------------------
#  		trains running on the route
#		Fri Nov 11 01:23:28 IST 2016
#------------------------------------------------------------------------
clear
echo ""
echo "$(tput setaf 3)"
echo ' Select the Train running this Route'
echo ' ====================================================
	22845		PUNE HATIA SUPERFAST 	
	12113		NAGPUR GARIBRATH	
	12129		AZAD HIND EXPRESS		
	11039		MAHARASHTRA EXPRESS'
echo ' =================================================== '
echo "$(tput sgr0)" 
echo -n " Enter Train number  : "
read train_number
export train_number
function_seat_availibilty()
{

 echo -n " Select the Class 2A 3A SL "
                                read class_select
                                case $class_select in
                                        2a|2A)
                                        booked_seat=`grep -e 2A -e 2a $1 | wc -l`
                                        available_seat=`expr 25 - $booked_seat`
                                        echo "Available seats = " $available_seat
                                        ;;

                                        3a|3A)
                                        booked_seat=`grep -e 3A -e 3a $1 | wc -l`
                                        available_seat=`expr 25 - $booked_seat`
                                        echo "Available seats = " $available_seat
                                        ;;

                                        sl|SL)
                                        booked_seat=`grep -e SL -e sl $1 | wc -l`
                                        available_seat=`expr 25 - $booked_seat`
                                        echo "Available seats = " $available_seat
                                        ;;

                                        *)
                                                echo ""
                                                echo " Please enter 3A 2A or SL "
                                esac

                                booked_seat=`wc -l pune_hatia_superfast.csv`
                                if [[ "$booked_seat" < 25 ]]
                                        then
                                        echo "`expr 25 - $booked_seat` are avaiable now"
                                elif [[ "$booked_seat" > 25 ]]
                                        then
                                        echo " $booked_seat are booked"
                                else [[ "$booked_seat" > 45 ]]
                                        echo "Regrate"
                                fi
}


function_availibity()
{
echo "" 
a=`grep -e 3A -e 3a $1 | wc -l`
sl=`grep -e SL -e sl $1 | wc -l`
b=`grep -e 2A -e 2a $1 | wc -l`
a1=`expr 25 - $a`
sl1=`expr 25 - $sl`
b1=`expr 25 - $b`
echo "$(tput setaf 5)"
echo  "		+----------------+------------------+----------------+"
echo  "		|   seats 3A     |    seats  2A     |    seats SL    |"
echo  "		+----------------------------------------------------+"
echo  "		| available $a1   | available $b1     | available $sl1   |"
echo  "		+----------------+------------------+----------------+"
echo "$(tput sgr0)"
}
case $train_number in 
	22845)		
			echo "$(tput setaf 2)"
echo "	                =========================================
			1. Check Avalibilty of seats 2A 3A SL
			2. Book your ticket
			========================================="
			echo "$(tput sgr0)"
			echo -n "      Choose option : "
			read i
			case $i in 
			1)    # check availability
			#	function_seat_availibilty pune_hatia_superfast.csv
			function_availibity pune_hatia_superfast.csv
			sleep 5 
			./route_train.sh
			;;
			
			2)  

			#  need to export varibale from_station ans to_sattion from journey script
			./booking_ticket.sh
			#   calcualte the distace between teh stations
			#    which outut the time table
			;;
			
			*)
			echo 'Please try again!!!!!!!!'
			esac
	;;
	
	12113)
			echo "$(tput setaf 2)"
echo "	                =========================================
			1. Check Avalibilty of seats 2A 3A SL
			2. Book your ticket
			========================================="
			echo "$(tput sgr0)"
			echo -n "      Choose option : "
                        read i
                        case $i in
                        1)    # check availability

					booked_seat=`grep -e 3A -e 3a garibrath.csv | wc -l`
                                        available_seat=`expr 25 - $booked_seat`
                                        a1=$available_seat
			echo "$(tput setaf 5)"
			echo  "			+----------------+"
			echo  "			|   seats 3A     |"
			echo  "			+----------------+"
			echo  "			| available $a1   |"
			echo  "			+----------------+"
			echo "$(tput sgr0)"

                                booked_seat=`wc -l garibrath.csv`
                                if [[ "$booked_seat" < 25 ]]
                                        then
                                        echo "`expr 25 - $booked_seat` are avaiable now"
                                elif [[ "$booked_seat" > 25 ]]
                                        then
                                        echo " $booked_seat are booked"
                                else [[ "$booked_seat" = 45 ]]
                                        echo "Regrate"
                                fi
			sleep 5 
			./route_train.sh
                        ;;

                        2) 

                        #  need to export varibale from_station ans to_sattion from journey script
			./booking_ticket.sh
                        #   calcualte the distace between teh stations
                        #    which outut the time table
                        ;;

                        *)
                        echo 'Please try again!!!!!!!!'
                        esac


	;;

	12129)
			echo "$(tput setaf 2)"
echo "	                =========================================
			1. Check Avalibilty of seats 2A 3A SL
			2. Book your ticket
			========================================="
			echo "$(tput sgr0)"
			echo -n "      Choose option : "
                        read i
                        case $i in
                        1)    # check availability
			# function_seat_availibilty azad_hind_express.csv
                        function_availibity azad_hind_express.csv
			sleep 5 
			./route_train.sh
			 ;;

                        2)  

                        #  need to export varibale from_station ans to_sattion from journey script
			./booking_ticket.sh
                        #   calcualte the distace between teh stations
                        #    which outut the time table
                        ;;

                        *)
                        echo 'Please try again!!!!!!!!'
                        esac


	;;

	11039)
 
			echo "$(tput setaf 2)"
echo "	                =========================================
			1. Check Avalibilty of seats 2A 3A SL
			2. Book your ticket
			========================================="
			echo "$(tput sgr0)"
			echo -n "      Choose option : "
                        read i
                        case $i in
                        1)    # check availability
                        # function_seat_availibilty maharashtra_express.csv
			function_availibity maharashtra_express.csv
			sleep 5 
			./route_train.sh
			;;

                        2)  # tarin time table

                        #  need to export varibale from_station ans to_sattion from journey script
			./booking_ticket.sh
                        #   calcualte the distace between teh stations
                        #    which outut the time table
                        ;;

                        *)
                        echo 'Please try again!!!!!!!!'
                        esac


	;;

	*)  # closing of outer case 

	echo "Please try again !!!!!!!"
esac

#echo "train_number=$train_number">>.station_details
 
