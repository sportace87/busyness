#!/bin/bash
isChimeCall=$(lsof | grep "/Applications/Amazon Chime.app/Contents/Resources/screen_control_cursor.tiff")
isTeamsCall=$(lsof | grep "/Applications/Microsoft Teams.app/Contents/MacOS/Teams")
if [ -n "$isChimeCall" ] || [ -n "$isTeamsCall" ]; then
    isCameraOn=$(node ~/Workspace/busyness/main.js)
    if $isCameraOn; then
        curl -X PUT -H "Content-Type: application/json" -d '{"numberOfLights": 1,"lights": [{"on": 1,"brightness": 40,"temperature": 190}]}' http://192.168.178.45:9123/elgato/lights
        curl -X PUT -H "Content-Type: application/json" -d '{"numberOfLights": 1,"lights": [{"on": 1,"brightness": 40,"temperature": 190}]}' http://192.168.178.44:9123/elgato/lights
        busylight --all on red
    else
        busylight --all on blue
    fi
else
    curl -X PUT -H "Content-Type: application/json" -d '{"numberOfLights": 1,"lights": [{"on": 0,"brightness": 40,"temperature": 190}]}' http://192.168.178.45:9123/elgato/lights
    curl -X PUT -H "Content-Type: application/json" -d '{"numberOfLights": 1,"lights": [{"on": 0,"brightness": 40,"temperature": 190}]}' http://192.168.178.44:9123/elgato/lights
    busylight --all on green
fi
