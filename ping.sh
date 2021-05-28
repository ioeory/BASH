#!/bin/bash
>/tmp/alive.txt
for x in {1..255} 
do
{
  for y in {1..255}
     do {
         ping 168.168.$x.$y  -c 1 >/dev/null 2>&1 
         [ $? -eq 0 ] && echo 168.168.$x.$y live >>/tmp/alive.txt  || echo 168.168.$x.$y dead &
         }& 
         sleep 1
     done
   wait
}&   
done
wait
