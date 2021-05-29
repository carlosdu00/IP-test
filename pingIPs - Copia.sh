#!/bin/bash
> log.txt
tamanho=`cat list.txt | wc -l`
ip=""
x=1
name=""
echo "\"enderecos\"" >> log.txt
while [ $x -le $tamanho ]
do
	ip=`cat list.txt | tail -n$x| head -n 1`
	name=`cat list.txt | tail -n$(($x+1))| head -n 1`
	ping -n 1 $ip > /dev/null
	if [ $? -eq 0 ]
	then
		echo "$name ON" >> log.txt
	else
		echo "$name OFF" >> log.txt
	fi
	x=$((x+2))
done
