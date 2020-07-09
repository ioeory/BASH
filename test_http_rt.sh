#!/bin/sh
usage(){
	echo usage:
	echo       $0 url
}

[ -z "$1"  ] && usage && exit
rtf="/tmp/result.txt"
nohup curl -I $1 >$rt 2>&1 &
sleep 2
rt=$(awk -F " " '/HTTP/{print $2}' $rtf)
echo $result

[ "$rt" = "200" ] && echo "200" || echo "other"

rm -rf $rtf
