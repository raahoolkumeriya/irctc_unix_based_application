#!/bin/bash

#---------------------------------------------------------------
#		script to display payment mode
#		Sun Nov 13 21:07:27 IST 2016
#--------------------------------------------------------------

from_station=`grep from_station .station_details | awk -F "=" '{print $2}'`
to_station=`grep to_station .station_details | awk -F "=" '{print $2}'`
train_number=`grep train_number .station_details | awk -F "=" '{print $2}'`
class_select=`grep class_select .station_details | awk -F "=" '{print $2}'`
fare_move()
{
	echo $total_cost | sed 's/-//g'
	echo "total_km=$total_km">.fare_details
	echo "total_cost=$total_cost">>.fare_details
}
# KM for train
starting_point=`grep $from_station killometer_chart.conf | awk -F "=" '{print $2}'`
#echo $starting_point
ending_point=`grep $to_station killometer_chart.conf | awk -F "=" '{print $2}'`
#echo $ending_point
total_km=$(($starting_point - ending_point))
#echo $total_km
function_rate_chart()
{

	if [[ "$total_km" < "50" ]]; then
total_cost=$(bc -l<<EOF
$total_km * $1 
EOF
)

	elif [[ "$total_km" -gt "50" && "$total_km" -lt "100" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.051)
EOF
)

	elif [[ "$total_km" > "100" ]] && [[ "$total_km" < "150" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.052)
EOF
)

	elif [[ "$total_km" > "150" ]] && [[ "$total_km" < "200" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.053)
EOF
)

	elif [[ "$total_km" > "200" ]] && [[ "$total_km" < "250" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.054)
EOF
)

	elif [[ "$total_km" > "250" ]] && [[ "$total_km" < "300" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.055)
EOF
)

	elif [[ "$total_km" > "300" ]] && [[ "$total_km" < "350" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.056)
EOF
)

	elif [[ "$total_km" > "350" ]] && [[ "$total_km" < "400" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.057)
EOF
)

	elif [[ "$total_km" > "400" ]] && [[ "$total_km" < "450" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.058)
EOF
)

	elif [[ "$total_km" > "450" ]] && [[ "$total_km" < "500" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.059)
EOF
)

	elif [[ "$total_km" > "500" ]] && [[ "$total_km" < "550" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.060)
EOF
)

	elif [[ "$total_km" > "550" ]] && [[ "$total_km" < "600" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.061)
EOF
)

	elif [[ "$total_km" > "600" ]] && [[ "$total_km" < "650" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.062)
EOF
)

	elif [[ "$total_km" > "650" ]] && [[ "$total_km" < "700" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.063)
EOF
)

	elif [[ "$total_km" > "700" ]] && [[ "$total_km" < "750" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.064)
EOF
)

	elif [[ "$total_km" > "750" ]] && [[ "$total_km" < "800" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.065)
EOF
)

	elif [[ "$total_km" > "800" ]] && [[ "$total_km" < "850" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.066)
EOF
)

	elif [[ "$total_km" > "850" ]] && [[ "$total_km" < "900" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.067)
EOF
)

	elif [[ "$total_km" > "900" ]] && [[ "$total_km" < "950" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.068)
EOF
)

	elif [[ "$total_km" > "950" ]] && [[ "$total_km" < "1000" ]];then
total_cost=$(bc -l<<EOF
$total_km * ($1 - 0.069)
EOF
)

	else
		echo ""
fi
}

#train_number=22845
case $train_number in 
	22845)
#		class_select='3A'	
		case $class_select in
			2A|2a)
				function_rate_chart 1.75		
				fare_move	
			;;
			3A|3a) 
				function_rate_chart 1.22
				fare_move	
			;;
			sl|SL)
				function_rate_chart 0.46
				fare_move	
			;;
			*)
			echo ""
		esac
			
	;;

	12113)
		case $class_select in
                        3A|3a)
                                function_rate_chart 1.10
				fare_move	
                        ;;
                        *)
                        echo ""
                esac

	;;
	
	12129)
		case $class_select in
                        2A|2a)
                                function_rate_chart 1.75
				fare_move	
                        ;;
                        3A|3a)
                                function_rate_chart 1.22
				fare_move	
                        ;;
                        sl|SL)
                                function_rate_chart 0.46
				fare_move	
                        ;;
                        *)
                        echo ""
                esac

	;;

	11039)
		case $class_select in
                        2A|2a)
                                function_rate_chart 1.70
				fare_move	
                        ;;
                        3A|3a)
                                function_rate_chart 1.178
				fare_move	
                        ;;
                        sl|SL)
                                function_rate_chart 0.489
				fare_move	
                        ;;
                        *)
                        echo ""
                esac

	;;
	*)

		echo "Please try again "
	
esac

#echo $total_km
#echo $total_cost
export total_km
export total_cost


