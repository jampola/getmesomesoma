#!/bin/bash
declare -a arr=("groovesalad" "indiepop" "secretagent" "spacestation" "dronezone" "u80s" "beatblender" "lush" "deepspaceone" "suburbsofgoa" "brfm" "poptron" "bagel" "digitalis" "sonicuniverse" "missioncontrol" "cliqhop" "sf1033")

for x in "${arr[@]}"
    do
        echo "Grabbing $x"
        formatted_url="http://somafm.com/m3u/"$x".m3u"
        curl -s $formatted_url | grep -ci "not found" && echo "Wrong Station Name" || curl -s $formatted_url > $x".m3u"
        sed -i s/icy/http/ $x".m3u"
    done

