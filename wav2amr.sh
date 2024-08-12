#!/bin/sh

folder=ua475

#sb=12.2k
sb=4.75k

for file in $(find "$folder" -type f -iname "*.wav")
do
    # amrnbenc -w 16 -i "$file" -o "${file%.pcm}.amr"
    echo "Converting $file to ${file%.wav}.amr"
    ffmpeg -i $file -ac 1 -ar 8000 -ab $sb ${file%.wav}.amr
    # ffmpeg -i $file -acodec libamr_nb -ar 8000 -ab 12.2k ${file%.wav}-nb.amr
    
done
