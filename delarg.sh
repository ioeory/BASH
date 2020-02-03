#!/bin/bash

DEV=$1
RESERVE=25500

check (){
[[ $DEV =  ""  ]] && echo "No input" && exit
DEVD=$(df |grep $DEV)
[[ $DEVD = "" ]] && echo "No Device $DEV" && exit
}


inst(){
while :

DEV_DIR=$(df -m |grep $DEV |awk '{print $6}')
DEV_AVL=$(df -m |grep $DEV |awk '{print $4}')
do
TARGET=${DEV_DIR}/`ls -rt $DEV_DIR |head -n 1`
	echo $DEV_DIR
	echo $DEV_AVL
	echo $TARGET
	[[ $DEV_AVL -lt $RESERVE ]] && echo "less than  $RESERVE " && rm -rf $TARGET\
		&& echo "$TARGET deleted !! " 
#	[[ $DEV_AVL -lt 1975 ]] && echo "less than 1975"
	
	sleep 5 
	clear
done
}

main(){
check
inst
}

main
