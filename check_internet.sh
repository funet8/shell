#!/bin/bash

#网络检查的脚本，当你不能上公网时，则直接执行这个脚本
#输入网卡和局域网路由器IP
#http://www.funet8.com/2897.html

#https://github.com/funet8/shell/blob/master/check_internet.sh

read -p "请输入您公网网卡名称：（如:eth0）" ethx

read -p "请输入您的局域网路由器IP：（如:192.168.1.1）" netip

ping -c 4 www.baidu.com > /dev/null 2>&1
if [ $? -eq 0 ];then
	 echo "可以上公网" 
	 exit 0
else
	 echo "很遗憾！您不能上网"
fi

linkstatus=`mii-tool $ethx |cut -d" " -f2`
if [ $linkstatus = negotiated ];then
	echo "您的网卡插好。"
else
	echo "请检查网线是否插好"
	exit 1
fi


ping -c 3 $netip > /dev/null 2>&1
if [ $? -eq 0 ];then
	 echo "ipOK" 
else
	 echo "IP有问题"
	exit 2
fi

ip=`ifconfig $ethx |grep Bcast |cut -d":" -f2 |cut -d" " -f1`

ipduan=`echo $netip |cut -d"." -f1,2` 

echo $ip |grep $ipduan &> /dev/null
if [ $? -eq 0 ];then
	echo "IP配置正常,路由器在一个网段！"
else
	echo "IP配置不在局域网内的网段中"
fi


route -n |grep ^0.0.0.0 &>/dev/null

if [ $? -eq 0 ];then
	echo "有网关"
else
	echo "无网关"
	exit 3
fi

gateway=`route -n |tail -1 |cut -d" " -f10`
echo 您的网关为：$gateway
ping -c 4 $gateway > /dev/null 2>&1
if [ $? -eq 0 ];then
	 echo "能ping通网关地址" 
	 exit 0
else
	 echo "不能能ping通网关地址，请检查网关配置"
fi


#下面的DNS也可以写其它的外网DNS服务器的IP，这里因为太多，不好判断，所以只判断了114.114.114.114和8.8.8.8或者路由器IP
dns=`cat /etc/resolv.conf |grep ^nameserver |cut -d" " -f2`
echo $dns
if [ $dns = "114.114.114.114" -o $dns = "8.8.8.8" -o $dns = $netip ];then
	echo "DNS配置正确"
else
 	echo "DNS有问题"
	exit 5 
fi

echo "上面都OK，请找相关网络管理员"
