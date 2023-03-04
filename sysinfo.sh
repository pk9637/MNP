#!/bin/bash

BOLD="\e[1m"
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
ENDCOLOR="\e[0m"

echo -e "**************************${BOLD}${GREEN}System Information${ENDCOLOR}*************************"
echo -e "${BOLD}${CYAN}Hostname:${ENDCOLOR}\t\t"`hostname`
echo -e "${BOLD}${CYAN}System IP:${ENDCOLOR}\t\t"`hostname -I`
echo -e "${BOLD}${CYAN}Version:${ENDCOLOR}\t\t"`cat /sys/class/dmi/id/product_version`
echo -e "${BOLD}${CYAN}Uptime:${ENDCOLOR}\t\t\t"`uptime | awk '{print $3,$4}' | sed 's/,//' | awk '{print $1}'` Hrs
echo -e "${BOLD}${CYAN}Operating System:${ENDCOLOR}\t"`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e "${BOLD}${CYAN}Kernel:${ENDCOLOR}\t\t\t"`uname -r`
echo -e "${BOLD}${CYAN}Processor Name:${ENDCOLOR}\t\t"`awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'`
echo ""

echo -e "****************************${BOLD}${GREEN}CPU/Memory Usage${ENDCOLOR}*************************"
echo -e "${BOLD}${CYAN}Memory Usage:${ENDCOLOR}\t"`free | awk '/Mem/{printf("%.2f%"), $3/$2*100}'`
echo -e "${BOLD}${CYAN}CPU Usage:${ENDCOLOR}\t"`cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1`
echo ""
