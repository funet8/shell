#!/bin/bash

startday="$1"
endday="$2"

date=`date -d "+0 day $startday" +%Y%m%d`
enddate=`date -d "+1 day $endday" +%Y%m%d`

if  [ ! -n "$startday" ] && [ ! -n "$startday" ]  ;then
	#echo "参数1,2为空时，执行前一天"
	date=`date -d "-1 day $1" +%Y%m%d`
	enddate=`date -d "+0 day $2" +%Y%m%d`	
fi


while [[ $date < $enddate ]]
do       
	cat /root/shell/url.txt | while read links
		do			
			echo "$links?""$date" 			
			sleep 3
		done	
		
		#增加一天
        date=`date -d "+1 day $date" +%Y%m%d`	
done


