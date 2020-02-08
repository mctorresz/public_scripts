#! /bin/bash
# requires ffmpeg
echo "What is your source FILETYPE? (without period)"
read srcExt
echo "What is your desired EXTENSION? (without period)"
read destExt

echo "What is your source DIRECTORY? (no parentheses)"
read srcDir
mkdir $srcDir/Converted

echo "What are your desired OPTIONS? (suggested is -ab 320k)"
read opts

for filename in "$srcDir"/*.$srcExt; do

        basePath=${filename%.*}
        baseName=${basePath##*/}

        ffmpeg -i "$filename" $opts /mnt/d/Downloads/Converted/"$baseName"."$destExt"

done

echo "Conversion from ${srcExt} to ${destExt} complete!"
