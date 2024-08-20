#!/bin/sh

folder=.
ab=12.2k

for file in $(find "$folder" -type f -iname "*.wav")
do
    # amrnbenc -w 16 -i "$file" -o "${file%.pcm}.amr"
    echo "Converting $file to ${file%.wav}.amr"
    ../ffmpeg -i $file -acodec libvo_amrwbenc -ar 16000 -ab $ab -ac 1 -hide_banner -loglevel error ${file%.wav}.amr
done
