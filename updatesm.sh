#!/bin/bash
oldpwd=$PWD
cd /etc/smokeping/config.d/
for target in $(ls -1 Targets-* | grep -v Targets-Graz); do cat $target | head -n 5 >> $target.new; cat /etc/smokeping/targetgen >> $target.new; rm $target; mv $target.new $target; echo $target updated; done
cat Targets-Graz-AT-Drei | head -n 14 >> Targets-Graz-AT-Drei.new; cat /etc/smokeping/targetgen >> Targets-Graz-AT-Drei.new; rm Targets-Graz-AT-Drei; mv Targets-Graz-AT-Drei.new Targets-Graz-AT-Drei; echo Targets-Graz-AT-Drei updated
/etc/init.d/smokeping restart
cd $oldpwd
