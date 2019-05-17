#!/bin/zsh

ip=$1
whois2=`gtimeout 5 whois $1`
address=`echo $whois2 | grep -i "^address" | tail -n1 | awk -F ":" '{print $2}' | tr -d '\n' | awk '$1=$1' `
city=`echo $whois2 | grep -i "^city" | tail -n1 | awk -F ":" '{print $2}' | tr -d '\n' | awk '$1=$1'`
country=`echo $whois2 | grep -i "^country" | tail -n1 | awk -F ":" '{print $2}' | tr -d '\n' | awk '$1=$1'`
phone=`echo $whois2 | grep -i "^phone" | tail -n1 | awk -F ":" '{print $2}' | tr -d '\n' | awk '$1=$1'`
org=`echo $whois2 | grep -i "^organization" | tail -n1 | awk -F ":" '{print $2}' | tr -d '\n' | awk '$1=$1'`
echo "$ip,$address,$city,$country,$phone,$org" >> "info.csv"
# echo "$address"
