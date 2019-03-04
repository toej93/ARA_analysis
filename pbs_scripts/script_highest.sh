#/bin/bash
#PBS -N findpeakvsquared_highest
#PBS -l nodes=1:ppn=5
#PBS -j oe
#PBS -A PCON0003
#PBS -m e
#PBS -l mem=24000MB
#PBS -l walltime=02:00:00

source /users/PCON0003/cond0068/.bash_profile_pitzer


cd /users/PCON0003/cond0068/ARA/AraRoot/analysis
declare -a runs=()
for i in {2000..2792}
do
    runs[$i]=$i
done

#echo ${runs[*]}                                                                                              
./findHighestVsquared 2 2013 ${runs[*]}

