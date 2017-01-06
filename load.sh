

#!/bin/bash
#ftsload/scripts/run.sh -s <server> -b <bucket> -d <dump path> -p <partitions> -w password
#set -x

DIR=$(pwd>&1)

PASSWORD="password"
SERVER="localhost"
DUMPPATH="${DIR}/dump"

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -s|--server)
    SERVER="$2"
    shift
    ;;
    -b|--bucket)
    BUCKET="$2"
    shift
    ;;
    -d|--dump)
    DUMPPATH="$2"
    shift
    ;;
    -p|--partitions)
    PARTITIONS="$2"
    shift
    ;;
    -w|--password)
    PASSWORD="$2"
    shift
    ;;
    *)
    ;;
esac
shift
done


$GOPATH/bin/gocbupload -s ${SERVER} -b ${BUCKET} -d ${DUMPPATH} -c ${PARTITIONS} -w ${PASSWORD}
