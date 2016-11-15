#!/bin/bash

#计算当前时间距离2017.01.01还有多久

goal=`date +%s -d 20170101`

while true
do
	now=`date +%s`
	if [ $[$goal - $now] -le 0 ];then
	 	break
	fi
	day=$[($goal-$now)/86400]
	hour=$[($goal-$now)%86400/3600]
	minute=$[($goal-$now)%3600/60]
	second=$[($goal-$now)%60]
	clear
	echo "离2017年还有$day天:$hour时:$minute分:$second秒"
	sleep 1
done
echo "2017年新年快乐!!!"
