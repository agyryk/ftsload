from couchbase.bucket import Bucket
import json
from threading import Thread
import sys


def upload_dump(offset, docs, cb_host, cb_bucket, cb_password, source_file):
    cb = Bucket("couchbase://{}/{}?operation_timeout=10".format(cb_host, cb_bucket), password=cb_password)
    key = offset * docs
    with open(source_file, 'r') as lines:
        for line in lines:
            doc = json.loads(line)
            hkey = hex(key)[2:]
            cb.upsert(hkey, doc)
            key += 1


def load():
    cb_host = sys.argv[1]
    cb_bucket = sys.argv[2]
    cb_password = sys.argv[3]
    source_path = sys.argv[4]
    partitions = sys.argv[5]

    docs_per_dump = 100000

    for i in range(0, int(partitions)):
        source_file = "{}/wiki_cb_dump_{}.txt".format(source_path, i)
        new_thread = Thread(target=upload_dump, args=(i,
                                                    docs_per_dump,
                                                    cb_host,
                                                    cb_bucket,
                                                    cb_password,
                                                    source_file,))
        new_thread.start()


load()