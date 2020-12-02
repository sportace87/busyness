#!/bin/bash
isChimeCall=$(lsof | grep "/Applications/Amazon Chime.app/Contents/Resources/screen_control_cursor.tiff")
isTeamsCall=$(lsof | grep "/Applications/Microsoft Teams.app/Contents/MacOS/Teams")
if [ -n "$isChimeCall" ] || [ -n "$isTeamsCall" ]; then
    isCameraOn=$(node ~/Workspace/busyness/main.js)
    if $isCameraOn; then
        busylight --all on red
    else
        busylight --all on orange
    fi
else
    busylight --all on green
fi