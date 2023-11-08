SMOKE_RESULTS="result.csv"
LOG_FILE="log.log"
	JMETER_SCRIPT_FILE=$1
 
SCRIPT_NAME=${JMETER_SCRIPT_FILE%%.*}
 
ls

while true
do
    jmeter -n -t $JMETER_SCRIPT_FILE \
	-l /data/$SMOKE_RESULTS -j /data/$LOG_FILE
done



echo "--------------- execution done --------------"

#cat $SMOKE_RESULTS

echo "--------------- check Logs below --------------"

#cat $LOG_FILE
