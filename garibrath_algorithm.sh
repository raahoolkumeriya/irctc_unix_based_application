#!/bin/bash

#------------------------------------------------------------------------------------
#		          seat booking algoritham
#	        	Sun Nov 13 10:05:46 IST 2016	
#------------------------------------------------------------------------------------

seat_array=(1 4 7 10 2 5 8 11 3 6 9 12)
#	    ^Lower | ^middle| ^upper

#	echo ${seat_array[*]}

boggie_array=('G1' 'G2' 'G3' 'G4' 'G5') 
#	echo ${boggie_array[*]}
#	echo ${boggie_array[0]} 

for i in ${seat_array[*]}
	do 
	for j in ${boggie_array[*]}
		do 
		seat_allocated="$j$i"
		echo $i$j 
		j=$(( $j + 1))
		done
	i=$(( $i + 1))
done
