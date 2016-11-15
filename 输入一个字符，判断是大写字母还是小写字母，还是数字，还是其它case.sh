#!/bin/bash

#输入一个字符，判断是大写字母还是小写字母，还是数字，还是其它

read -p "请输入一个字符:" word

case "$word" in
	[[:upper:]] )
		echo "大写字母"
		;;
	[[:lower:]])
		echo "小写字母"
		;;
	[[:digit:]])
		echo "数字"
		;;
	* )
		echo "其它"
esac	
