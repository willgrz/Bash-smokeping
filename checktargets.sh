#!/bin/bash
for ip in $(cat /etc/smokeping/targetgen  | grep 'host =' | awk '{print $3}'); do
	echo $ip
	ping -c2 -W 2 $ip | grep loss
done
