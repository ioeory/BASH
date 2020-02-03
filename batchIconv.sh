#/bin/bash
[[ $1 = "" ]] && echo -e "\033[33mNo file input ! \033[0m" && exit
[[ ! -e $1 ]] && echo -e "\033[31mFile not found !\033[0m" && exit

path=`readlink -f $1`

find $path -name "*.txt"|while read file
do
	[[ -d $file ]] && echo -e "\033[36m "$file" is a directory ,skip\033[0m" && continue #"当前文件若为目录则跳出本轮循环"
	filename=`echo "$file" |awk -F "." 'NF--' ` #以"."为分割，不打印最后一列。
	echo -e "\033[33m$filename\033[0m"
	echo -e "\033[36mConverting "$file" to "$filename".text ...\033[0m"
	iconv "$file" -f GB18030 -t UTF-8 -o "$filename".text
	[[ $? -ne 0 ]] && echo -e "\033[31mConvert ${file} failed...\033[0m" && continue
	echo -e "\033[32mConvert successfully ! \033[0m"
done
