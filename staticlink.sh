#!/bin/bash
find /var/www/html/ -maxdepth 1 -lname '*' -exec rm {} \;
for file in $(ls -1 /var/cache/smokeping/images/); do ln -s /var/cache/smokeping/images/$file /var/www/html/$file; done
