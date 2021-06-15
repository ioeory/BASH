#!/bin/bash
>/tmp/alive.txt
for x in {1..255} 
do
{
  for y in {1..255}

     do {
         IP=168.168.$x.$y
         ping $IP  -c 1 -W 1 >/dev/null 2>&1
         [ $? -eq 0 ] && echo $IP >>/tmp/alive.txt  || echo $IP dead &
         }& 
         sleep 1
     done
   wait
}&   
done
wait
