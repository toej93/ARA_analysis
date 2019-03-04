#/bin/bash
#PBS -N readTree_highest
#PBS -l nodes=1:ppn=10
#PBS -j oe
#PBS -A PCON0003
#PBS -m e
#PBS -l mem=64000MB
#PBS -l walltime=03:30:00

source /users/PCON0003/cond0068/.bash_profile_pitzer


cd /users/PCON0003/cond0068/ARA/AraRoot/3.13/analysis

declare -a arr=("4.5" "5.3" "5.8")
#declare -a arr=("2.5") 
for i in "${arr[@]}"
do
    rm hist_from_data_"$i".root 
    #./readTree_highest $i /users/PAS0654/osu8354/ARA/AraSim/trunk/outputs/AraOut.setup_"$i"_th_stdnoise.txt.run* &
    ./readTree_highest $i /fs/scratch/PAS0654/jorge/sim_results/AraOut.setup_"$i"_th.txt.run* &
done
wait
