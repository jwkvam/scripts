#!/bin/sh
# 
# Create gifs for GitHub Readme

palette="/tmp/palette.png"

filters="fps=15,scale=880:-1:flags=lanczos"

ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
