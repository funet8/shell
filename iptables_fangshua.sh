#!/bin/sh 
#########################################################
####功能介绍:读取nginx日志最后N行数，获取IP和访问数######
####超过一定数目就将此ip在防火墙中过滤			   ######
####每天凌晨重启防火墙，清除规则   				   ######
#########################################################
#根据：https://bbs.aliyun.com/read/50817.html  思路改编


#vi /data/conf/shell/iptables_fangshua.sh
#chmod +x /data/conf/shell/iptables_fangshua.sh
#echo "* * * * * root /data/conf/shell/iptables_fangshua.sh" >> /etc/crontab
#service crond restart


#每天凌晨重启防火墙
#echo "01 1 * * * root /etc/init.d/iptables restart" >> /etc/crontab
#service crond restart


status=`tail -n1000 /data/wwwroot/log/www.funet8.com-access.log |awk '{print $3}'| awk -F":" '{print $NF}' |sort|uniq -c|sort -nr|head -1` 
NUM=`echo $status|awk '{print $1}'` 	#最多IP次数
IP=`echo $status|awk '{print $2}'` 		#最多IP地址
result=`echo "$NUM > 200" | bc` 
if [ $result = 1 ] 
then 
echo IP:$IP is over $NUM, NoAccess IT! >> /data/wwwroot/log/Iptables_NoAccess_IP.log
/sbin/iptables -I INPUT -s $IP -j DROP
mv /data/wwwroot/log/www.funet8.com-access.log /data/wwwroot/log/www.funet8.com-access_$(date "+%Y-%m-%d-%H-%M-%S").log
/etc/init.d/nginx reload
fi
