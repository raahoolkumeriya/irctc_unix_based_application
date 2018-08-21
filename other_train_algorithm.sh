#!/bin/bash

#------------------------------------------------------------------------------------
#		          seat booking algoritham
#	        	Sun Nov 13 10:05:46 IST 2016	
#------------------------------------------------------------------------------------

########################  FOR 2A CLASS

class_select=$1
if [[ "$class_select" == "2A"  ]] 
then
        seat_array=(1 4 7 2 5 8 3 6 9)
#		echo ${seat_array[*]}

	boggie_array=('A2-1' 'A2-2') 
#		echo ${boggie_array[*]}
#		echo ${boggie_array[0]} 

	for i in ${seat_array[*]}
		do 
		for j in ${boggie_array[*]}
			do 
			seat_allocated="$j$i"
			echo $j / $i 
			j=$(( $j + 1))
			done
		i=$(( $i + 1))
	done

###########################  for 3A CLASS
elif [[ "$class_select" == "3A"  ]]
then
        seat_array=(1 4 7 2 5 8 3 6 9)
#               echo ${seat_array[*]}

        boggie_array=('A3-1' 'A3-2')
#               echo ${boggie_array[*]}
#               echo ${boggie_array[0]}

        for i in ${seat_array[*]}
                do
                for j in ${boggie_array[*]}
                        do
                        seat_allocated="$j$i"
                        echo $j / $i
                        j=$(( $j + 1))
                        done
                i=$(( $i + 1))
        done
############### FOR SLEEPER CLASS
else

        seat_array=(1 4 7 2 5 8 3 6 9)
#               echo ${seat_array[*]}

        boggie_array=('S1' 'S4' 'S2' 'S3')
#               echo ${boggie_array[*]}
#               echo ${boggie_array[0]}
        for i in ${seat_array[*]}
                do
                for j in ${boggie_array[*]}
                        do
                        seat_allocated="$j$i"
                        echo $j / $i
                        j=$(( $j + 1))
                        done
                i=$(( $i + 1))
        done
fi

