# Log Analyzer script

## Overview
The script analyzes log files which we need to provide as an input and it gives insights such as:
- Total number of log entries
- Errors and warnings in the log files
- Top 3 frequently occuring errors.

## Usage

Make sure to first make the script executable
chmod +x log_analyzer.sh

Run the script
./log_analyzer.sh <log_file>

Example
./log_analyzer.sh application.log

To run this script, I have considered one of the log files which I have also committed as a sample log file.
If there is any change in the log file, then subsequent changes need to be done on the awk and grep commands as well to extract the correct content.


Sample output: 
Log Summary Report
------------------
Total lines : 12453
ERROR       : 763
WARN        : 1456
INFO        : 10234

Top 3 errors:
23 Database connection timeout
17 Failed to authenticate user
11 Disk space threshold exceeded


## How the script works
* Reads the log file and counts the total number of lines
* Filters the file for errors and warnings using `grep` and `awk`
* Finds the most frequent errors by using `sort` and `uniq`
* Finally it generates a summary report of the logs.


## Future Improvements
* Add realtime alerting to improve overall monitoring.
* Make this into a reusable CLI tool.
* Export output in JSON or CSV format. 

