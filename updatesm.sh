#!/bin/bash
oldpwd=$PWD
cd /etc/smokeping/config.d/
for target in $(ls -1 Targets* | grep -v TargetsAT); do cat $target | head -n 6 >> $target.new; cat /etc/smokeping/targetgen >> $target.new; rm $target; mv $target.new $target; echo $target updated; done
cat TargetsAT | head -n 19 >> TargetsAT.new; cat /etc/smokeping/targetgen >> TargetsAT.new; rm  TargetsAT; mv TargetsAT.new TargetsAT; echo TargetsAT updated
cd $oldpwd
