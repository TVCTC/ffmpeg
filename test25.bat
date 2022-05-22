@echo off
::
title=Test 25
::
:: Description: Horizontal scrolling text
::
set USER_AGENT="User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36"
set REFERER="Referer: https://www.costadelmar-radio.com/chillout/"
set VIDEO="https://www.costadelmar-radio.com/Videos/HD/Flying Over Bermuda 4K.mp4"
set AUDIO="https://radio4.cdm-radio.com:18020/stream-mp3-Chill"
set FORMAT=mpegts
set OUTPUT="udp://@239.0.0.1:2022?ttl=1&pkt_size=1316"
::
ffmpeg -headers %USER_AGENT% -headers %REFERER% ^
-re -i %VIDEO% -re -i %AUDIO% ^
-map 0:0 -map 1:0 ^
-c:a copy ^
-c:v libx264 -preset ultrafast ^
-s 1280x720 -r 30 -g 60 ^
-vf "drawtext=text='VIJESTI': x=w-(mod(10*n\,w+tw)-tw/40): y=h-line_h-10: fontfile='C\:\\Windows\\Fonts\\Arial.ttf': fontsize=40: fontcolor=black: box=1: boxcolor=red@0.6: boxborderw=1" ^
-maxrate 7500k -bufsize 15000k ^
-f %FORMAT% %OUTPUT%
::
