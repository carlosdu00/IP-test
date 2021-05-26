#!/bin/bash

date
cat list.txt |  while read output
do
	ping -n 1 $output > /dev/null
	sleep 1
	if [ $? -eq 0 ]
	then
		echo "$output ON" >> log.txt
	else
		echo "$output OFF" >> log.txt
	fi
done
