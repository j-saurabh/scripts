#!/bin/bash

#Check if the arguments are passed
if [ "$#" -ne 1 ]; then
    echo -e "Please provide a log file \nUsage: $0 <logfile>"
    exit 2
fi

logfile=$1

#read -p "Enter the file which needs to be checked:" logfile

#Stop execution if log file does not exist
if [ ! -f "$logfile" ]; then            
    echo "Error : File '$logfile' does not exist" >&2
    exit 1
fi

#echo "The file entered is correct"


error_count=$(grep -c "ERROR" "$logfile")

#Alternate cmd cat $logfile | grep "ERROR" | wc -l

warn_count=$(grep -c "WARN" "$logfile")
info_count=$(grep -c "INFO" "$logfile")

echo "Errors in the logfile : $error_count"
echo "Warnings in the logfile : $warn_count"

#Error rate alerting 
# Alternate if [ "$error_count" -gt 10 ]; then 

if (( $error_count > 10 )); then 
    echo "High error rate detected!" >&2
    alert_exit_code=2                                # it is exit 2 only as the alert condition detected
else
    echo "Error rate under control, please further monitor"
fi

    
#Top 3 most frequent error messages in the log file
most_frequent_errors=$(grep "ERROR" "$logfile" \
| awk '{$1=$2=""; sub(/^ +/, ""); print}'  \
| sort \
| uniq -c \
| sort -nr \
| head -3)

#the awk in the above command will remove extra spaces and timestamps and only print the error message


total_lines=$(wc -l < "$logfile" | awk '{print $1}')

#Alternate : total_lines=$(wc -l < $logfile | xargs)
#Alternate : total_lines=$(cat $logfile | wc -l | tr -d ' ')

echo "Log Summary Report"
echo "------------------"

echo "Total lines : $total_lines"
echo "ERROR : $error_count"
echo "WARN  : $warn_count"
echo "INFO  : $info_count"

echo -e "Top 3 errors: \n$most_frequent_errors"

exit $alert_exit_code
