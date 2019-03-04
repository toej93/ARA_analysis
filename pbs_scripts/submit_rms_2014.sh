#/bin/bash

#PBS -N rms_2014
#PBS -l nodes=1:ppn=40
#PBS -j oe
#PBS -A PCON0003
#PBS -m e
#PBS -l mem=128000MB
#PBS -l walltime=15:00:00

source /users/PCON0003/cond0068/.bash_profile_pitzer
cd /users/PCON0003/cond0068/ARA/AraRoot/3.13/analysis

j=1922
while [ $j -lt 3786 ]
do
    END=$[$j+40]
    for i in $(seq $j $END) #3785
    do
	echo $i

	FileName="/fs/scratch/PAS0654/ara/10pct/RawData/A3/2014/sym_links/event00"$i".root"
	if [ -f "$FileName" ]
	then
	    ./A3_rms $FileName &
	else
	    continue
	fi
    done
    wait
    j=$[$j+40]
done
