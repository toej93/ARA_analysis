#/bin/bash

#PBS -N glitch_finder_2013_30pct
#PBS -l nodes=1:ppn=40
#PBS -j oe
#PBS -A PCON0003
#PBS -m e
#PBS -l mem=128000MB
#PBS -l walltime=15:00:00

source /users/PCON0003/cond0068/.bash_profile_pitzer
cd /users/PCON0003/cond0068/ARA/AraRoot/3.13/analysis

j=473
while [ $j -lt 1901 ]
do
    END=$[$j+40]
    for i in $(seq $j $END) #3785
    do
	echo $i

	FileName="/fs/scratch/PAS0654/ara/10pct/RawData/A3/2013/sym_links/event"$i".root"
	if [ -f "$FileName" ]
	then
	    ./A3_wf_glitch_search $FileName &
	else
	    continue
	fi
    done
    wait
    j=$[$j+40]
done
