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
    fi;
    sleep 1; \
done;


pre_str=`cat ./attendance_system/data.json|tail -n 4|head -n 2|tr "\n" " "|cut -b 19-27,50-70`;while true;do str=`cat ./attendance_system/data.json|tail -n 4|head -n 2|tr "\n" " "|cut -b 19-27,50-70`;if [ "$str" != "$pre_str" ];then echo $str;pre_str=$str;fi;sleep 1;done;

ssh kbit01@133.92.145.205 'pre_str=`cat ./attendance_system/data.json|tail -n 4|head -n 2|tr "\n" " "|cut -b 19-27,50-70`;while true;do str=`cat ./attendance_system/data.json|tail -n 4|head -n 2|tr "\n" " "|cut -b 19-27,50-70`;if [ "$str" != "$pre_str" ];then echo $str;pre_str=$str;fi;sleep 1;done;' >> tmp.txt

t="attendance_system/data.json"; \
p=`date -r $t +%d%H%M%S`; \
while true; do
    c=`date -r $t +%d%H%M%S`; \
    if [ "$c" != "$p" ]; then
        echo `cat $t | tail -n 4 | head -n 2 | tr "\n" " " | cut -b 19-27,50-70`; \
        p=$c; \
    fi;
    sleep 2; \
done;


t="attendance_system/data.json";p=`date -r $t +%d%H%M%S`;while true;do c=`date -r $t +%d%H%M%S`;if [ "$c" != "$p" ];then echo `cat $t|tail -n 4|head -n 2|tr "\n" " "|cut -b 19-27,50-70`;p=$s;fi;sleep 2;done;

t="attendance_system/data.json";d="+%d%H%M%S";p=`date -r $t $d`;while true;do c=`date -r $t $d`;if [ "$c" != "$p" ];then echo `cat $t|tail -n 4|head -n 2|tr "\n" " "|cut -b 19-27,50-70`;p=$s;fi;sleep 2;done;

ssh kbit01@133.92.145.205 't="attendance_system/data.json";d="+%d%H%M%S";p=`date -r $t $d`;while true;do c=`date -r $t $d`;if [ "$c" != "$p" ];then echo `cat $t|tail -n 4|head -n 2|tr "\n" " "|cut -b 19-27,50-70`;p=$c;fi;sleep 2;done;' >> tmp.txt

cat $t|tail -n 4|tr "\n" " "|cut -b 19-27,50-70

ssh kbit01@133.92.145.205 't="attendance_system/data.json";d="+%d%H%M%S";p=`date -r $t $d`;while true;do c=`date -r $t $d`;if [ "$c" != "$p" ];then cat $t|tail -n 4|tr "\n" " "|cut -b 19-27,50-70;p=$c;fi;sleep 2;done;' >> tmp.txt


# クライアント側でリアルタイムに表示する用
t="tmp.txt"; \
p=`date -r $t +%d%H%M%S`; \
while true; do
    c=`date -r $t +%d%H%M%S`; \
    if [ "$c" != "$p" ]; then
        echo `cat $t | tail -n 1`; \
        p=$c; \
    fi;
    sleep 2; \
done;

t="tmp.txt";p=`date -r $t +%d%H%M%S`;while true;do c=`date -r $t +%d%H%M%S`;if [ "$c" != "$p" ];then echo `cat $t | tail -n 1`;p=$c;fi;sleep 2;done;


t=tmp.txt;p=`date -r $t +%d%H%M%S`;while true;do c=`date -r $t +%d%H%M%S`;if [ $c != $p ];then cat $t | tail -n 1;p=$c;fi;sleep 2;done;
t=tmp.txt;d=+%d%H%M%S;p=`date -r $t $d`;while true;do c=`date -r $t $d`;if [ $c != $p ];then cat $t | tail -n 1;p=$c;fi;sleep 2;done;
# 現状最短
t=tmp.txt;d="date -r $t +%d%H%M%S";p=`$d`;while true;do c=`$d`;if [ $c != $p ];then cat $t|tail -n 1;p=$c;fi;sleep 2;done;


# SSH接続してログ抜き出してくるやつ
ssh kbit01@133.92.145.205 't=attendance_system/data.json;d=+%d%H%M%S;p=`date -r $t $d`;while true;do c=`date -r $t $d`;if [ $c != $p ];then cat $t|tail -n 4|tr "\n" " "|cut -b 19-27,50-70;p=$c;fi;sleep 2;done;' >> tmp.txt

t=attendance_system/data.json;d="date -r $t +%d%H%M%S";p=`$d`;while true;do c=`$d`;if [ $c != $p ];then cat $t|tail -n 4|tr "\n" " "|cut -b 19-27,50-70;p=$c;fi;sleep 2;done;

# 現状最短
ssh kbit01@133.92.145.205 't=attendance_system/data.json;d="date -r $t +%d%H%M%S";p=`$d`;while true;do c=`$d`;if [ $c != $p ];then cat $t|tail -n 4|tr "\n" " "|cut -b 19-27,50-70;p=$c;fi;sleep 2;done;' >> tmp.txt
