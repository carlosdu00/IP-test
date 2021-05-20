#!/bin/bash
i=0

while [ i -lt 1 ] do
	date
	cat /path/to/list.txt |  while read output do
   		ping -c 1 "$output" > /dev/null
    		if [ $? -eq 0 ]; then
    			echo "node $output is up" 
    		else
    			echo "node $output is down"
    		fi
    		sleep 5
	done
done
