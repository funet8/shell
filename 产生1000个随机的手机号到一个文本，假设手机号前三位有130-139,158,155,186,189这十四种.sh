#!/bin/bash

#产生1000个随机的手机号到一个文本，假设手机号前三位有130-139,158,155,186,189这十四种

array=( 130 131 132 133 134 135 136 137 138 139 158 155 186 189 )

for i in `seq 1 1000`

do
	head=${array[$RANDOM%14]}
	n1=$[RANDOM%10]
	n2=$[RANDOM%10]
	n3=$[RANDOM%10]
	n4=$[RANDOM%10]
	n5=$[RANDOM%10]
	n6=$[RANDOM%10]
	n7=$[RANDOM%10]
	n8=$[RANDOM%10]
	echo "$head$n1$n2$n3$n4$n5$n6$n7$n8" >> suijinumber.txt
done


