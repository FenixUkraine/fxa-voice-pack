#!/bin/sh

server="baden@het.navi.cc"
root="/home/baden/www/files/FX500/voice_packs"

ssh $server "mkdir -p $root/ua01"
rsync -am --include='*.amr' --exclude='*.wav' --exclude='*.sh' ./ua01/ $server:$root/ua01
ssh $server "mkdir -p $root/ua475"
rsync -am --include='*.amr' --exclude='*.wav' --exclude='*.sh' ./ua475/ $server:$root/ua475

