#!/bin/bash

red='\033[1;31m'

printf "$red \n

 __  __  ____ ______   ___ ______ __      ___  __ __ ______   ___  
 ||\ || ||    | || |  //   | || | ||     // \\ || || | || |  // \\ 
 ||\\|| ||==    ||   ((      ||   ||     ||=|| || ||   ||   ((   ))
 || \|| ||___   ||    \\__   ||   ||__|  || || \\_//   ||    \\_// 

"
sleep 1
sudo wifi-menu
if [ $? -eq 0 ]; then
	echo CONNECTION ESTABLISHED...
else
	if [ $? -ne 0 ]; then
	echo "WRONG AP OR PASSPHRASE.."
	sleep 1
	echo "Select AP.."
		FILE=$(dialog --stdout --title "choose it" --fselect /etc/netctl/ 14 48) 
		echo "${FILE} selected" 
		wname=${FILE##*/}
	echo "TYPE IN NEW PASSWORD"
	read pass
	sudo sed -i -E "/^Key/s/=[[:alnum:]]+/=$pass/" $FILE
	sleep 1
	echo Trying to connect..
	sleep 1
	clear 
	echo Success!
	sudo netctl start $wname
	fi
fi
