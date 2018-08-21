#--------------------------------------------------------------------
#			Tue Nov 22 15:06:31 IST 2016
#		Script for SIGNUP for irctc reservations
#--------------------------------------------------------------------

echo 
echo -e "\t\t\t\t+++++++++++++++++++++++++++++"
echo -e "\t\t\t\tWelcome to IRCTC SIGN UP Page"	
echo -e "\t\t\t\t+++++++++++++++++++++++++++++"
echo
echo -n "Enter the USER ID ( 8 characheters only )       : "
read USER_ID
echo
echo -n "Enter the Password ( 8 characters only )         : "
read password
echo
echo -n "Please confirm your Password once                : "
read confirm_password
echo

if [[ "password" -ne "confirm_password" ]]
then 
	echo 
	echo "Password does NOT match...Please try again"
	exit
else
	
echo -n "Enter the First Name                             : "
read FIRST_NAME
echo
echo -n "Enter your last Name                             : "
read LAST_NAME
echo
echo -n "Enter your Gender (M/F/O)		          : "
read GENDER
echo
echo -n "Enter your Mob Number  			  : "
read MOB_NUMBER
echo
echo -n "Enter your locality				  : "
read LOCALITY
echo

SEQ=`sqlplus -s $ORA_USER/$ORA_PASS<<EOD
set heading off
set serveroutput on
set feedback off
set tab off
set pagesize 0
select count(1) from IRCTC_LOGIN_DETAILS;
exit;
EOD`

echo
SEQ=$((SEQ+1))
echo

sqlplus -s $ORA_USER/$ORA_PASS<<EOF
INSERT INTO IRCTC_LOGIN_DETAILS (SR_NO,USER_ID,PASSWORD,FIRST_NAME,LAST_NAME,GENDER,MOB_NUMBER,LOCALITY )
 VALUES ( $SEQ,'$USER_ID','$confirm_password','$FIRST_NAME','$LAST_NAME','$GENDER',$MOB_NUMBER,'$LOCALITY' );
commit;
exit;
EOF


fi

echo "Your login @IRCTC has been created successfully "
echo "Please note down your USER ID : $USER_ID    "
	
echo
echo
echo












