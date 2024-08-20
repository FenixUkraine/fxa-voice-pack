#!/bin/sh

# 4.75, 5.15, 5.9, 6.7, 7.4, 7.95, 10.2, 12.2

# ffmpeg -i test.wav -ar 8000 -ab 4.75k -ac 1 amr-4.75.amr
# ffmpeg -i test.wav -ar 8000 -ab 6.7k -ac 1 amr-6.7.amr
# ffmpeg -i test.wav -ar 8000 -ab 12.2k -ac 1 amr-12.2.amr
./ffmpeg -i test.wav -acodec libvo_amrwbenc -ar 16000 -ab 4.75k -ac 1 amr-wb-4.75.amr
./ffmpeg -i test.wav -acodec libvo_amrwbenc -ar 16000 -ab 23.85k -ac 1 amr-wb-23.85.amr
# ffmpeg -i test.wav -acodec libopencore_amrnb -ar 8k -ab 12.2k -ac 1 amr-12.2nb.amr
