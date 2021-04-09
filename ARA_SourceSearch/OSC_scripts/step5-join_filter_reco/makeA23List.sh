#!/bin/bash

#this makes a list of all Filter files for the station A23 Diffuse analysis, years 2013-2016
#results are stored in A2List_1in10.txt files and the like

#run like "bash makeA23FilterList.sh station year"
#like "bash makeA23FilterList.sh 2 2013"

station=$1
year=$2

echo "[ Station: " $station " ] "
echo "[ Year: " $year " ] "

find /fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ProcessedFile/A${station}/${year}/*filter* > A${station}FilterList_1in10_${year}.txt
