#!/bin/bash
sed -i '/<pre>/d' index.html
filesize=`cat list.txt | wc -l`
x=1
name=""
while [ $x -le $filesize ]
do
	ip=`cat list.txt | tail -n$x| head -n 1`
	name=`cat list.txt | tail -n$(($x+1))| head -n 1`
	ping -n 2 -w 3 $ip >/dev/null
	if [ $? -eq 0 ]
	then
		sed -i "14i <pre> <img src="media/iconeON.png">  status: ON          IP:$ip        <div id= "name">$name</div></pre>" index.html

	else
		sed -i "14i <pre> <img src="media/iconeOFF.png">  status: OFF         IP:$ip        <div id= "name">$name</div></pre>" index.html
	fi
	x=$((x+2))
done
