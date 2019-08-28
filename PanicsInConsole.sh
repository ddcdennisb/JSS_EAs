# List only the .panic files and count how many lines 
numOfPanics=$(ls -l /Library/Logs/DiagnosticReports/ |grep Kernel) 

echo "<result>$numOfPanics</result>"