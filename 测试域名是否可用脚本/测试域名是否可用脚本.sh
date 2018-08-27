#!/bin/bash

FilePath="/root/yumin2.txt"
LogFile="/root/log.txt"

rm -rf $LogFile

cat $FilePath | while read keywords
	do
		echo "域名："$keywords"" >> $LogFile
		#curl "$keywords" >> $LogFile
		curl "$keywords" 2>> $LogFile ###错误输出
		echo "##########分割线######################################################" >> $LogFile			
done   

#cat $LogFile
