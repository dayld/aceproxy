#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Usage: $0 stream-id"
    exit 1
fi

echo "[+] Building container..."
docker build . -t aceproxy:local

bash -c ./stop.sh

echo "[+] running container..."
docker run -d --rm -p 8000:8000 -e STREAM_ID="$1" --name aceproxy aceproxy:local

#URL="http://127.0.0.1:8000/pid/$1/stream.mp4"
URL="http://127.0.0.1:8000/env/"

echo "[+] Opening VLC with URL..."
echo "$URL"
open -a vlc --args "$URL"