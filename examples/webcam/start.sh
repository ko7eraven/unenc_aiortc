#!/bin/sh

sudo modprobe v4l2loopback video_nr="99" 'card_label=virtcam'

sudo gst-launch-1.0 -v v4l2src device=/dev/video1 ! video/x-raw, framerate=20/1, width=640, height=480 ! vpuenc_h264 ! v4l2sink device=/dev/video99 &

sleep 5 # allow it to get started

sudo python3 webcam.py --no-transcode --preferred-codec=video/H264



