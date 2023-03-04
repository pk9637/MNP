#!/bin/bash

echo -e "**************************System Information*************************"
echo -e "Hostname:\t\t"`hostname`
echo -e "System IP:\t\t"`hostname -I`
echo -e "Version:\t\t"`cat /sys/class/dmi/id/product_version`
echo -e "Uptime:\t\t\t"`uptime | awk '{print $3,$4}' | sed 's/,//' | awk '{print $1}'` Hrs
echo -e "Operating System:\t"`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e "Kernel:\t\t\t"`uname -r`
echo -e "Processor Name:\t\t"`awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'`
echo ""

echo -e "****************************CPU/Memory Usage*************************"
echo -e "Memory Usage:\t"`free | awk '/Mem/{printf("%.2f%"), $3/$2*100}'`
echo -e "CPU Usage:\t"`cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1`
echo ""
