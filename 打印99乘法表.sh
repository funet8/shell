#!/bin/bash
        i=1
        while [ $i -le 9 ]
        do
                n=1
                        while [ $n -le $i ]
                        do

                                r=$[$n*$i]
                                echo -en "$n*$i=$r\t"
                                let n=n+1

                        done
                echo -e "\n"
                let i=i+1
        done
