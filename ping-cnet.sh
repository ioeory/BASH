#!/bin/bash
> /tmp/alive.txt
for x in {1..255} 
do
{
   ping 192.168.1.$x  -c 1 >/dev/null 2>&1 
   [ $? -eq 0 ] && echo 192.168.1$x >>/tmp/alive.txt  || echo 192.168.1.$x dead &
}&   
done
wait
