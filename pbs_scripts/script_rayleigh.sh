#/bin/bash
#PBS -N RayleighA2
#PBS -l nodes=1:ppn=40
#PBS -j oe
#PBS -A PCON0003
#PBS -m e
#PBS -l mem=64000MB
#PBS -l walltime=20:00:00

source /users/PCON0003/cond0068/.bash_profile_pitzer


cd /users/PCON0003/cond0068/ARA/AraRoot/analysis
rm Rayleigh_spectral_dist.root

j=2000
while [ $j -lt 2792 ]
do
    END=$[$j+40]
    for i in $(seq $j $END) #3785
    do
	echo $i

	FileName="/fs/scratch/PAS0654/ara/10pct/RawData/A2/2013/sym_links/event"$i".root"
#        FileName="/fs/scratch/PAS0654/ara/10pct/RawData/A2/2014/sym_links/event00"$i".root"

	if [ -f "$FileName" ]
	then
	    ./make_fits_noise 2 2013 $i &
	else
	    continue
	fi
    done
    wait
    j=$[$j+40]
done

