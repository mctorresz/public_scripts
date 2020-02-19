#! /bin/bash
# requires ffmpeg

echo "Source file is" $1

ffmpeg -i "$1" -vf scale=720x480 "$1.compressed.mp4"

echo "Compression Complete!"

#video size ‘ntsc’
