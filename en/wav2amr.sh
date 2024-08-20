#!/bin/sh

folder=v1

for file in $(find "$folder" -type f -iname "*.wav")
do
    # amrnbenc -w 16 -i "$file" -o "${file%.pcm}.amr"
    echo "Converting $file to ${file%.wav}.amr"
    ffmpeg -i $file -ar 8000 -ab 12.2k -ac 1 -hide_banner -loglevel error ${file%.wav}.amr
    #ffmpeg -i $file -acodec libamr_nb -ar 8000 -ab 12.2k ${file%.wav}-nb.amr
    
done
