#!/bin/bash

#this makes a list of all 100pct reco files for the station A23 Diffuse analysis, years 2013-2016
#results are stored in AX_cY_RecoFiles.txt files and the like
#you must have already sorted the reco output files by configuration for this to work
#scripts to do that sorting are elsewhere (yay...)

#run like "bash makeA23100RecoList.sh station year"
#like "bash makeA23100RecoList.sh 2 2013"

station=$1
config=$2

if [[ $station -eq 0 || $config -eq 0 ]] ; then
    echo 'Error in usage! Run like: bash sort_by_config.sh <station> <config>'
    exit 1
fi

echo "[ Station: " $station " ] "
echo "[ Config: " $config " ] "

find /fs/project/PAS0654/ARA_DATA/A23/10pct_verify/ProcessedFile/A$station/by_config/c$config/*_reco.root > 'A'$station'_c'$config'_RecoFiles.txt'
