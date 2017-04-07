#!/bin/bash
#删除N天前的文件，并且记录

# echo "0 7 1 * * root /data/conf/shell/delete_channels_apk.sh" >> /etc/crontab
#service crond restart

################自动删除n天前的文件#########################
ndays="60" 									#保留ndays+1天前的文件
wheredir="/data/wwwroot/web/apk_download/*/channels/*"
logfiledate="/data/wwwroot/web/apk_download/delete_apk.log"

#删除过期的全备
echo -e "........................start waiting......................" >> $logfiledate
#/usr/bin/find /data/wwwroot/web/apk_download/*/channels/* -mtime +6
for efile in $(/usr/bin/find $wheredir -mtime +$ndays)
do
	if [ -d ${efile} ]; then
		rm -rf "${efile}"
		echo -e "删除过期文件文件夹:${efile}" >> $logfiledate
	elif [ -f ${efile} ]; then
		rm -rf "${efile}"
		echo -e "删除过期文件:${efile}" >> $logfiledate	
	fi;
done

echo "完成于: `date +%F' '%T' '%w`" >> $logfiledate
exit 0
