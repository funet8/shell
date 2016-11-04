#!/bin/bash

#计算1到100的奇数之和

#方法一

echo "方法一";
for i in `seq 1 2 100`
do
        #echo $i
        sum=$[$sum+$i];
done
echo $sum

#方法二
sum2=0
echo "方法二";

for i in `seq 1 100` 
do 
	[ $[$i%2] -eq 1 ] && sum2=$[$sum2+$i]	
done
echo $sum2

#方法三
echo "方法三";
sum3=0
for i in `seq 100`
do 
	[ $[$i%2] -eq 0 ] && continue
	sum3=$[$sum3+$i]
done 
echo $sum3

