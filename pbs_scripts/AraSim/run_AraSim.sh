#/bin/bash
#PBS -l nodes=1:ppn=40
#PBS -j oe
#PBS -A PAS0654
#PBS -m e
#PBS -o logs/
#PBS -l mem=128000MB
#PBS -l walltime=10:20:00
source /users/PCON0003/cond0068/.bash_profile_pitzer_root6
#module load modules/au2016

cd $RUN_DIR
git checkout a23_4yr_diffuse

j=0
while [ $j -lt 100 ]
do
    END=$[$j+40]
    for i in $(seq $j $END) #3785
    do
        echo $i
        ./AraSim $INPUTFILE $i $TMPDIR &
    done
    wait
    j=$[$j+40]
    pbsdcp $TMPDIR/'*' $OUTPUT_DIR
done
