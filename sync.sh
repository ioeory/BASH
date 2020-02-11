#!/bin/bash
pkill rsync
while [ 1 ]
do
 rsync -avz --delete -e "ssh -p 22222"  user@example.com:/user/docs . --progress
    if [ "$?" = "0" ] ; then
        echo "rsync completed normally"
        exit
    else
        echo "Rsync failure. Backing off and retrying..."
        sleep 180
    fi
done
