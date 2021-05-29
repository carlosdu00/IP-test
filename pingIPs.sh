#!/bin/bash
> log.json
tamanho=`cat list.txt | wc -l`
ip=""
x=1
nome=""
echo "\"enderecos\":[" >> log.json
while [ $x -le $tamanho ]
do
	ip=`cat list.txt | tail -n$x| head -n 1`
	nome=`cat list.txt | tail -n$(($x+1))| head -n 1`
	ping -n 1 $ip > /dev/null
	if [ $? -eq 0 ]
	then
		echo "{\"nome\":\"$nome\", \"ip\":\"$ip\", \"status\":\"on\"}," >> log.json
	else
		echo "{\"nome\":\"$nome\", \"ip\":\"$ip\", \"status\":\"off\"}," >> log.json
	fi
	x=$((x+2))
done
echo "]" >> log.json
