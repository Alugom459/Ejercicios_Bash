#!/bin/bash



for (( i=1 ; i <=10 ; i++  ));
do
	resultado=$(( $1 * i ))
	echo "$1 x $i = $resultado  "

done

