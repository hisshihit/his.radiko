#!/bin/bash

pid=$$
#date=`date '+%Y-%m-%d-%H_%M'`
date=`date '+%Y%m%d-%H%M-4'`
outdir="."

if [ $# -le 1 ]; then
  echo "usage : $0 channel_name duration(minuites) [outputdir] [prefix]"
  exit 1
fi

if [ $# -ge 2 ]; then
  channel=$1
  DURATION=`expr $2 \* 60 + 15`
fi
if [ $# -ge 3 ]; then
  outdir=$3
fi
PREFIX=${channel}
if [ $# -ge 4 ]; then
  PREFIX=$4
fi

#
# set channel
#
case $channel in
  "NHK1")
    aspx="https://nhkradioakr1-i.akamaihd.net/hls/live/511633/1-r1/1-r1-01.m3u8"
    ;;
  "NHK2")
    aspx="https://nhkradioakr2-i.akamaihd.net/hls/live/511929/1-r2/1-r2-01.m3u8"
    ;;
  "FM")
    aspx="https://nhkradioakfm-i.akamaihd.net/hls/live/512290/1-fm/1-fm-01.m3u8"
    ;;
  "NHK1_SAPPORO")
    aspx="https://nhkradioikr1-i.akamaihd.net/hls/live/512098/1-r1/1-r1-01.m3u8"
    ;;
  "NHK2_SAPPORO")
    aspx="https://nhkradioakr2-i.akamaihd.net/hls/live/511929/1-r2/1-r2-01.m3u8"
    ;;
  "FM_SAPPORO")
    aspx="https://nhkradioikfm-i.akamaihd.net/hls/live/512100/1-fm/1-fm-01.m3u8"
    ;;
  "NHK1_SENDAI")
    aspx="https://nhkradiohkr1-i.akamaihd.net/hls/live/512075/1-r1/1-r1-01.m3u8"
    ;;
  "NHK2_SENDAI")
    aspx="https://nhkradioakr2-i.akamaihd.net/hls/live/511929/1-r2/1-r2-01.m3u8"
    ;;
  "FM_SENDAI")
    aspx="https://nhkradiohkfm-i.akamaihd.net/hls/live/512076/1-fm/1-fm-01.m3u8"
    ;;
  "NHK1_NAGOYA")
    aspx="https://nhkradiockr1-i.akamaihd.net/hls/live/512072/1-r1/1-r1-01.m3u8"
    ;;
  "NHK2_NAGOYA")
    aspx="https://nhkradioakr2-i.akamaihd.net/hls/live/511929/1-r2/1-r2-01.m3u8"
    ;;
  "FM_NAGOYA")
    aspx="https://nhkradiockfm-i.akamaihd.net/hls/live/512074/1-fm/1-fm-01.m3u8"
    ;;
  "NHK1_OSAKA")
    aspx="https://nhkradiobkr1-i.akamaihd.net/hls/live/512291/1-r1/1-r1-01.m3u8"
    ;;
  "NHK2_OSAKA")
    aspx="https://nhkradioakr2-i.akamaihd.net/hls/live/511929/1-r2/1-r2-01.m3u8"
    ;;
  "FM_OSAKA")
    aspx="https://nhkradiobkfm-i.akamaihd.net/hls/live/512070/1-fm/1-fm-01.m3u8"
    ;;
  "NHK1_HIROSHIMA")
    aspx="https://nhkradiofkr1-i.akamaihd.net/hls/live/512086/1-r1/1-r1-01.m3u8"
    ;;
  "NHK2_HIROSHIMA")
    aspx="https://nhkradioakr2-i.akamaihd.net/hls/live/511929/1-r2/1-r2-01.m3u8"
    ;;
  "FM_IROSHIMA")
    aspx="https://nhkradiofkfm-i.akamaihd.net/hls/live/512087/1-fm/1-fm-01.m3u8"
    ;;
  "NHK1_MATSUYAMA")
    aspx="https://nhkradiozkr1-i.akamaihd.net/hls/live/512103/1-r1/1-r1-01.m3u8"
    ;;
  "NHK2_MATSUYAMA")
    aspx="https://nhkradioakr2-i.akamaihd.net/hls/live/511929/1-r2/1-r2-01.m3u8"
    ;;
  "FM_MATSUYAMA")
    aspx="https://nhkradiozkfm-i.akamaihd.net/hls/live/512106/1-fm/1-fm-01.m3u8"
    ;;
  "NHK1_FUKUOKA")
    aspx="https://nhkradiolkr1-i.akamaihd.net/hls/live/512088/1-r1/1-r1-01.m3u8"
    ;;
  "NHK2_FUKUOKA")
    aspx="https://nhkradioakr2-i.akamaihd.net/hls/live/511929/1-r2/1-r2-01.m3u8"
    ;;
  "FM_FUKUOKA")
    aspx="https://nhkradiolkfm-i.akamaihd.net/hls/live/512097/1-fm/1-fm-01.m3u8"
    ;;
  *)
    echo "failed channel"
    exit 1
    ;;
esac

sleep 15
ffmpeg -loglevel quiet -y -i ${aspx} -t ${DURATION} -movflags faststart -c copy -bsf:a aac_adtstoasc "${outdir}/${PREFIX}_${date}.m4a"
