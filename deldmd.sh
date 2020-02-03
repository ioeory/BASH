#!/bin/bash
DEV=sde4
RESERVE=2600
while :
DEV_DIR=$(df -m |grep $DEV |awk '{print $6}')
DEV_AVL=$(df -m |grep $DEV |awk '{print $4}')
#TARGET=$DEV_DIR/test.img
do
#TARGET=$(find ${DEV_DIR} -type f -printf '%p\n' | sort | head -n 1)
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
