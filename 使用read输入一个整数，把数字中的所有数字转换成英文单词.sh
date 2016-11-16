#!/bin/bash

#使用read输入一个整数，把数字中的所有数字转换成英文单词
#如:2345  转换为 two three four five

read -p "输入一个整数:" num

length=`echo $num |wc -L`

for i in `seq $length`
do
	n=`echo $num |cut -c$i`

case "$n" in 
	0 ) echo -n "zero " ;;
	1 ) echo -n "one " ;;
	2 ) echo -n "two " ;;
	3 ) echo -n "three " ;;
	4 ) echo -n "four "  ;;
	5 ) echo -n "five " ;;
	6 ) echo -n "six " ;;
	7 ) echo -n "seven " ;;
	8 ) echo -n "eight " ;;
	9 ) echo -n "nine " ;;
	* ) clear
	    echo "你输入的不是一个整数"
	    exit 1
esac
	
done
	
echo

