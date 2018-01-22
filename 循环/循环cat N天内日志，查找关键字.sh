#!/bin/bash

#time:2018-1-22

#功能描述：循环cat N天内日志，查找关键字
########定义变量
#文件路径：
FilePath="/home/data_log/nginx_old_log/2018/01"
LogFile="/root/log.txt"

rm -rf $LogFile

for((i = 1; i <= 9; i++))  
do  
			cat /root/keywords.txt | while read keywords
			do
				#echo $i 
				#echo $keywords		
				echo "关键字："$keywords" 日期：12月"$i"日的记录" >> log.txt
				cat $FilePath/www.abc.com-access.log_2018010$i.log |grep $keywords |wc -l >> log.txt
				echo "##########分割线######################################################" >> log.txt				
			done   
done  

#cat $LogFile




