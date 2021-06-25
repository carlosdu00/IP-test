#!/bin/bash
sed -i '/<pre>/d' index.html
tamanho=`cat list.txt | wc -l`
x=1
nome=""
while [ $x -le $tamanho ]
do
	ip=`cat list.txt | tail -n$x| head -n 1`
	nome=`cat list.txt | tail -n$(($x+1))| head -n 1`
	ping -n 2 -w 3 $ip >/dev/null
	if [ $? -eq 0 ]
	then
		sed -i "15i <pre> <img src="media/iconeON.png">  status: ON      IP:$ip     $nome</pre>" index.html

	else
		sed -i "15i <pre> <img src="media/iconeOFF.png">  status: OFF     IP:$ip     $nome</pre>" index.html
	fi
	x=$((x+2))
done
