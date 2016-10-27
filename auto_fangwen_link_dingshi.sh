#!/bin/sh

#########################################################
####执行访问某个时间段的url							#####
#加参数和不加参数
#参数加时间段，例如：/data/conf/shell/auto_fangwen_link_dingshi.sh 2014-06-01 2014-06-30
#不加参数则执行前一天：
#########################################################

#vi /data/conf/shell/auto_fangwen_link_dingshi.sh

#chmod +x /data/conf/shell/auto_fangwen_link_dingshi.sh
#每天凌晨3点执行一次
#echo "0 3 * * * root /data/conf/shell/auto_fangwen_link_dingshi.sh >/dev/null" >> /etc/crontab
#service crond restart

startday="$1"
endday="$2"

date=`date -d "+0 day $startday" +%Y%m%d`
enddate=`date -d "+1 day $endday" +%Y%m%d`

if  [ ! -n "$startday" ] && [ ! -n "$startday" ]  ;then
	#参数1,2为空时，执行前一天
	date=`date -d "-1 day $1" +%Y%m%d`
	enddate=`date -d "+0 day $2" +%Y%m%d`	
fi

link1="http://www.funet8.com/cron_spend_bysub.php?date="
link2="http://www.funet8.com/cron_spend_bygid.php?date="
link3="http://www.funet8.com/cron_date_click.php?date="
link4="http://www.funet8.com/cron_date_member.php?date="
link5="http://www.funet8.com/cron_date_liucun.php?d=2&date="
link6="http://www.funet8.com/cron_date_liucun.php?d=3&date="
link7="http://www.funet8.com/cron_date_liucun.php?d=7&date="

while [[ $date < $enddate ]]
do       
		echo "$link1""$date" >> /data/wwwroot/otherlog/cps_links.log
        /usr/bin/curl "$link1""$date" >/dev/null
        sleep 3
		
		echo "$link2""$date" >> /data/wwwroot/otherlog/cps_links.log
        /usr/bin/curl "$link2""$date" >/dev/null
        sleep 3
		
		echo "$link3""$date" >> /data/wwwroot/otherlog/cps_links.log
        /usr/bin/curl "$link3""$date" >/dev/null
        sleep 3
		
		echo "$link4""$date" >> /data/wwwroot/otherlog/cps_links.log
        /usr/bin/curl "$link4""$date" >/dev/null
        sleep 3
		
		echo "$link5""$date" >> /data/wwwroot/otherlog/cps_links.log
        /usr/bin/curl "$link5""$date" >/dev/null
        sleep 3
		
		echo "$link6""$date" >> /data/wwwroot/otherlog/cps_links.log
        /usr/bin/curl "$link6""$date" >/dev/null
        sleep 3
		
		echo "$link7""$date" >> /data/wwwroot/otherlog/cps_links.log
        /usr/bin/curl "$link7""$date" >/dev/null
        sleep 3
		
		#增加一天
        date=`date -d "+1 day $date" +%Y%m%d`
	sleep 3
done

