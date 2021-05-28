#!/bin/bash
> /tmp/alive.txt
for x in {1..255} 
do
{
   ping 168.168.70.$x  -c 1 >/dev/null 2>&1 
   [ $? -eq 0 ] && echo 168.168.70.$x live >>/tmp/alive.txt  || echo 168.168.70.$x dead &
}&   
done
wait
