#!/bin/sh
### Make sure Notepad++ is set to Edit->EOL Conversion->Unix
### For running within Windows Subsystem for Linux
### Introduction
echo 'What would you like to do?'
echo '1 - Trim Video (LQ)'
echo '2 - LQ Download'
echo '3 - HQ Download'
echo '4 - Video Only Download'
echo '5 - Multi LQ Download'
read option
echo "You selected" + $option
case $option in
	1)
		### Trim
		echo 'Executing Trim Function'
		echo 'What is the Youtube Link?'
		read answer_yt

		file_name=$(youtube-dl -e $answer_yt)\-$(youtube-dl --get-id $answer_yt).mp4
		echo 'The temporary filename is: ' $file_name
		echo

		echo 'What is the start time? As HH:MM:SS'
		read answer_st
		echo

		echo 'What is the end time? As HH:MM:SS'
		read answer_end
		echo

		echo 'What is the output filename? (add .mp4)' 
		read answer_out

		mkdir temp
		cd temp
		youtube-dl -f '(mp4)[height<480]' --external-downloader ffmpeg --external-downloader-args "-ss $answer_st -to $answer_end -async 1 /mnt/d/Videos/YoutubeDownloader/$answer_out" $answer_yt
		cd ..
		rm -r temp

		echo
		echo 'Completed Trim Function'
	;;
	
	2)
		### LQ Download
		echo 'What is the Youtube Link?'
		read answer_yt

		file_name=$(youtube-dl -e $answer_yt)\-$(youtube-dl --get-id $answer_yt).mp4
		echo 'The filename is: ' $file_name
		echo

		youtube-dl -f '(mp4)[height<480]' -o '/mnt/d/Videos/YoutubeDownloader/%(title)s.%(ext)s' $answer_yt
		
		echo
		echo 'Complete LQ Download function'
	;;
	
	3)
		### HQ Download
		echo 'What is the Youtube Link?'
		read answer_yt

		youtube-dl -o '/mnt/d/Videos/YoutubeDownloader/%(title)s.%(ext)s' $answer_yt
		
		echo 'Completed HQ Download function'
	;;
	
	4)
		### Video Only Download
		echo 'Executing Video Only Download Function'
		echo 'What is the Youtube Link?'
		read answer_yt

		file_name=$(youtube-dl -e $answer_yt)\-$(youtube-dl --get-id $answer_yt).mp4
		echo 'The temporary filename is: ' $file_name
		echo

		echo 'What is the output filename? (add .mp4)' 
		read answer_out

		mkdir temp
		cd temp
		youtube-dl -f '(mp4)[height<480]' --external-downloader ffmpeg --external-downloader-args "-an -async 1 /mnt/d/Videos/YoutubeDownloader/$answer_out" $answer_yt
		## Note: if you need to add trim into this on, just add '-ss $answer_st -to $answer_end' into the args above and some "read" statements before
		cd ..
		rm -r temp

		echo
		echo 'Completed Trim Function'
	;;
	
	5)
		### Multi LQ Download
		echo 'What is the Youtube Link?'
		read answer_yt

		echo

		youtube-dl -f '(mp4)[height<480]' -o '/mnt/d/Videos/YoutubeDownloader/%(title)s.%(ext)s' $answer_yt
		
		echo
		echo 'Complete Multi LQ Download function'
	;;
	
	*)
		echo 'error'
	;; 
esac
