
#!/bin/bash
#ftsload/scripts/run.sh -o <operations> -c <clients> -q <query> -u <usr> -w <password> -s <server> -p <ftsport> -i <fts index>
#set -x

DIR=$(pwd>&1)

USER="Administrator"
PASSWORD="password"
SERVER="localhost"
PORT="8094"


while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -o|--operations)
    OPERATIONS="$2"
    shift
    ;;
    -c|--clients)
    CLIENTS="$2"
    shift
    ;;
    -q|--query)
    QUERY="$2"
    shift
    ;;
    -u|--user)
    USER="$2"
    shift
    ;;
    -w|--password)
    PASSWORD="$2"
    shift
    ;;
    -s|--server)
    SERVER="$2"
    shift
    ;;    
    -p|--port)
    PORT="$2"
    shift
    ;;
    -i|--index)
    INDEX="$2"
    shift
    ;;
    *)
    ;;
esac
shift
done

if [[ $@ == *"--debug"* ]]
then
  DEBUG="ON"
fi

if [ ${QUERY} == "term-high" ]; then
    QUERY_FILE="/datasets/hi.dat"
elif [ ${QUERY} = "term-med" ]; then
    QUERY_FILE="/datasets/med.dat"
elif [ ${QUERY} == 'term-low' ]; then
    QUERY_FILE="/datasets/low.dat"    
elif [ ${QUERY} == 'high-and-med' ]; then
    QUERY_FILE="/datasets/hi-and-med.dat"
elif [ "${QUERY}" == 'high-or-med' ]; then
    QUERY_FILE="/datasets/hi-or-med.dat"
elif [ "${QUERY}" == 'date-facet' ]; then
    QUERY_FILE="/datasets/date-facet.dat"
elif [ "${QUERY}" == 'custom' ]; then
    QUERY_FILE="/datasets/custom.dat"
fi

echo FILE is "${QUERY_FILE}"

if [ "${DEBUG}" == "ON" ]; then
    DEBUGFLAG="-debug"
else
    DEBUGFLAG=
fi
    
$GOBIN/hey -n "${OPERATIONS}" -c "${CLIENTS}" -m POST -D "${DIR}""${QUERY_FILE}" -T "application/json" -a "${USER}":"${PASSWORD}" ${DEBUGFLAG} http://"${SERVER}":"${PORT}"/api/index/"${INDEX}"/query