#!/bin/bash

#this makes a list of all Filter files for the station A23 Diffuse analysis, simulation

#run like "bash makeA23FilterList.sh station config energy"
#like "bash makeA23FilterList.sh 2 4 18.0"

station=$1
config=$2
energy=$3

echo "[ Station: " $station " ] "
echo "[ Config: " $config " ] "
echo "[ Energy: " $energy " ] "

find /fs/project/PAS0654/ARA_DATA/A23/sim/ProcessedFile/A${station}/c${config}/E${energy}/*filter* > A${station}_c${config}_E${energy}_FilterList.txt
