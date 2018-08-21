#!/bin/bash

#-----------------------------------------------------------------------------
#		train ticket booking
#	   Wed Nov  9 11:24:00 IST 2016
#-----------------------------------------------------------------------------
strip_function(){
offset=232
for num1 in {0..23}
#for num1 in {0..255}
do {
shownum=`expr $offset + $num1`
echo -en "\E[0;48;5;${shownum}m   \E[0m"
}
done
echo
}

clear
strip_function
echo "		            $(tput setab 4)Welcome to IRCTC$(tput sgr0) "
strip_function
echo  "	$(tput setaf 7)$(tput setab 1)!! WARNING -$(tput setab 4)\"No Animals were harmed while writing this CODE\"$(tput sgr0)"
echo " "
echo ""
echo -n " Enter the User name  :  "
read username

echo "select USER_ID from IRCTC_LOGIN_DETAILS where USER_ID like '$username';" > select.sql
USER_ID=`sh oracle_connect.sh select.sql` 



if [[ "$username" == "$USER_ID" ]] 
then
	echo ""
	echo -n " Enter password       :  "
	read -s password

	#---------   Fetched password and comapre then move forawd


echo "select PASSWORD from IRCTC_LOGIN_DETAILS where USER_ID='$username';" > select.sql
original_password=`sh oracle_connect.sh select.sql`

echo


#	if [[ "$password" == "$original_password" ]] 
#		then
		echo ""
		captcha=`date | md5sum | cut -c 1-5` 
		echo ""
		echo ""
		echo "$(tput setaf 4)"
		echo ======================================== 
		#cowsay $captcha ; 
		echo $captcha ; 
		echo ======================================== 
		echo "$(tput sgr0)" 
	
		echo ""
		echo -n 'Enter the CAPTCHA  : '
		read entered_captcha
		captcha_enter=`echo $entered_captcha | tr [:upper:] [:lower:]`
		#----- condition the enter capcha is right or wrong

		BASE=$captcha
		CMD=$captcha_enter
		echo ""
		if [[ "$CMD" == "$BASE" ]]; then
			echo '		Welcome to IRCTC website'
		#   Train seelction script
			./journey_plan.sh
		else
			echo ""
			echo '			Please enter the correct capcha'
		fi

		echo ""
#	else 
#		echo "Enter the correct password"
#	fi


else
	echo ""
	echo $(tput setaf 1)	
	echo "			Please check Username/Password enter correctly"
#	sleep 4
#	./train_ticket_booking.ksh
	echo $(tput sgr0)
	echo ""
	echo ""
fi


