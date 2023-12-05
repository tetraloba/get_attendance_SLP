#!/bin/bash
# ssh kbit01@133.92.145.205 'tail -f ./attendance_system/data.json' | tail -n 3 # 無理。


date -r ./attendance_system/data.json +%r
watch -tn 1 date

watch -t cat ./attendance_system/data.json | tail -n 4 | head -n 2

ssh kbit01@133.92.145.205 'watch -t cat ./attendance_system/data.json | tail -n 4 | head -n 2'

date -r ./attendance_system/data.json

pre_str=`cat ./attendance_system/data.json | tail -n 4 | head -n 2`; \
while true; do
    str=`date -r ./attendance_system/data.json | tail -n 4 | head -n 2`; \
    if [ "$pre_str" -ne "$str" ]; then
        echo $str; \
        $pre_str=$str; \
    fi;
    sleep 1; \
done;


pre_str=`cat ./attendance_system/data.json | tail -n 4 | head -n 2`; \
while true; do
    str=`date -r ./attendance_system/data.json | tail -n 4 | head -n 2`; \
    if [ 10 -ne 9 ]; then
        echo $str; \
        $pre_str=$str; \
    sleep 1; \
    fi;
done;


cat ./attendance_system/data.json | tail -n 4 | head -n 2 | tr "\n" " "

pre_str=`cat ./attendance_system/data.json | tail -n 4 | head -n 2 | tr "\n" " " | tr -d '"'`; \
while true; do
    str=`cat ./attendance_system/data.json | tail -n 4 | head -n 2 | tr "\n" " " | tr -d '"'`; \
    if [ "$str" -ne "$pre_str" ]; then
        echo $str; \
        pre_str=$str; \
    sleep 1; \
    fi;
done;

cat ./attendance_system/data.json | tail -n 4 | head -n 2 | tr "\n" " " | tr -d '"' | cut -b 17-23,44-62



pre_str=`cat ./attendance_system/data.json | tail -n 4 | head -n 2 | tr "\n" " " | tr -d '"' | cut -b 17-23,44-62`; \
while true; do
    str=`cat ./attendance_system/data.json | tail -n 4 | head -n 2 | tr "\n" " " | tr -d '"' | cut -b 17-23,44-62`; \
    if [ "$str" -ne "$pre_str" ]; then
        echo $str; \
        pre_str=$str; \
    sleep 1; \
    fi;
done;





pre_str=`cat ./attendance_system/data.json | tail -n 4 | head -n 2 | tr "\n" " " | tr -d '"' | cut -b 17-23,44-62`; \
while true; do
    str=`cat ./attendance_system/data.json | tail -n 4 | head -n 2 | tr "\n" " " | tr -d '"' | cut -b 17-23,44-62`; \
    if [ "$str" != "$pre_str" ]; then
        echo $str; \
        pre_str=$str; \
    sleep 1; \
    fi;
done;

cat ./attendance_system/data.json | tail -n 4 | head -n 2 | tr "\n" " " | cut -b 19-27,50-70

pre_str=`cat ./attendance_system/data.json | tail -n 4 | head -n 2 | tr "\n" " " | cut -b 19-27,50-70`; \
while true; do
    str=`cat ./attendance_system/data.json | tail -n 4 | head -n 2 | tr "\n" " " | cut -b 19-27,50-70`; \
    if [ "$str" != "$pre_str" ]; then
        echo $str; \
        pre_str=$str; \
    sleep 1; \
    fi;
done;


pre_str=`cat ./attendance_system/data.json|tail -n 4|head -n 2|tr "\n" " "|cut -b 19-27,50-70`;while true;do str=`cat ./attendance_system/data.json|tail -n 4|head -n 2|tr "\n" " "|cut -b 19-27,50-70`;if [ "$str" != "$pre_str" ];then echo $str;pre_str=$str;sleep 1;fi;done;

