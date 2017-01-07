#!/bin/bash
#set -x

DIR=$(pwd>&1)

echo Downloading testdata dump files...

curl "https://s3-us-west-2.amazonaws.com/perf-artifacts/fts_load_standalone_dump/wiki_cb_dump_0.txt" -o ${DIR}/dump/wiki_cb_dump_0.txt
curl "https://s3-us-west-2.amazonaws.com/perf-artifacts/fts_load_standalone_dump/wiki_cb_dump_1.txt" -o ${DIR}/dump/wiki_cb_dump_1.txt
curl "https://s3-us-west-2.amazonaws.com/perf-artifacts/fts_load_standalone_dump/wiki_cb_dump_2.txt" -o ${DIR}/dump/wiki_cb_dump_2.txt
curl "https://s3-us-west-2.amazonaws.com/perf-artifacts/fts_load_standalone_dump/wiki_cb_dump_3.txt" -o ${DIR}/dump/wiki_cb_dump_3.txt
curl "https://s3-us-west-2.amazonaws.com/perf-artifacts/fts_load_standalone_dump/wiki_cb_dump_4.txt" -o ${DIR}/dump/wiki_cb_dump_4.txt
curl "https://s3-us-west-2.amazonaws.com/perf-artifacts/fts_load_standalone_dump/wiki_cb_dump_5.txt" -o ${DIR}/dump/wiki_cb_dump_5.txt
curl "https://s3-us-west-2.amazonaws.com/perf-artifacts/fts_load_standalone_dump/wiki_cb_dump_6.txt" -o ${DIR}/dump/wiki_cb_dump_6.txt
curl "https://s3-us-west-2.amazonaws.com/perf-artifacts/fts_load_standalone_dump/wiki_cb_dump_7.txt" -o ${DIR}/dump/wiki_cb_dump_7.txt
curl "https://s3-us-west-2.amazonaws.com/perf-artifacts/fts_load_standalone_dump/wiki_cb_dump_8.txt" -o ${DIR}/dump/wiki_cb_dump_8.txt
curl "https://s3-us-west-2.amazonaws.com/perf-artifacts/fts_load_standalone_dump/wiki_cb_dump_9.txt" -o ${DIR}/dump/wiki_cb_dump_9.txt



echo Getting load tools...
go get -u github.com/agyryk/hey
go get -u github.com/agyryk/gocbupload

echo Setup complete