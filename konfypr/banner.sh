#!/bin/bash
echo "Banner"
str=$1
n=$(expr length "$str")
printf "+-"
for((i=0;i<n;i++))
do
printf "-"
done
echo "-+"
printf "| "
for i in $str
do
printf "%s " $i
done
echo "|"
printf "+-"
for((i=0;i<n;i++))
do
printf "-"
done
echo "-+"
