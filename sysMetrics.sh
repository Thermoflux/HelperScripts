#! /bin/bash
function dumpSysMetrics($LogFilePath){
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
echo "$MEMORY$DISK$CPU" > $LogFilePath
}
## If you need to run this through cron, uncomment line 11. 
## Or else you can use the command line to call this function
## Call the above function here with log file path as an input
# dumpSysMetrics('~/Logs/sysMetrics.log')
