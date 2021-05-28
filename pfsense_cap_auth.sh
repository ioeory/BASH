#!/bin/sh
while :
do
	ping -c  2 114.114.114.114
	[ $? -ne 0 ] && curl -d "auth_user=test&auth_pass=test123&accept=Continue&zone=whitelist" -v http://192.168.1.1:8002/index.php\?zone=whitelist

	sleep 10
done
