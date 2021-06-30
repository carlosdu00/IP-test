#!/bin/bash

delay=0
while [ $delay -le 0 ]
do
clear
echo "Scan intervals in minutes?"
read delay
done
delay=$((delay*60))

while [ true ] 
do
	sed -i '/<pre>/d' index.html
	filesize=`cat list.txt | wc -l`
	x=1
	name=""
	while [ $x -le $filesize ]
	do
		now=$(date)
		clear
		echo "Scan timer: $(($delay/60)) minute(s)"
		echo last update $now
		ip=`cat list.txt | tail -n$x| head -n 1`
		name=`cat list.txt | tail -n$(($x+1))| head -n 1`
		ping -n 2 -w 3 $ip >/dev/null
		if [ $? -eq 0 ]
		then
			sed -i "16i <pre> <img src="media/iconeON.png">  status: ON          IP:$ip        <div id= "name">$name</div></pre>" index.html

		else
			sed -i "16i <pre> <img src="media/iconeOFF.png">  status: OFF         IP:$ip        <div id= "name">$name</div></pre>" index.html
		fi
		x=$((x+2))
	done
	echo on interval...
	sleep $delay
done
	
