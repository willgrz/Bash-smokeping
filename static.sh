#!/bin/bash
time /usr/bin/perl /usr/sbin/smokeping --config=/etc/smokeping/config --static=/var/www/html/
/etc/smokeping/staticlink.sh
sleep 600
