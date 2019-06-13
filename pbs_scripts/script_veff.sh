#/bin/bash                                                                                              
#PBS -l nodes=1:ppn=8                                                                                   
#PBS -j oe                                                                                              
#PBS -A PAS0654                                                                                         
#PBS -m e                                                                                                
#PBS -l mem=128000MB                                                                                     
#PBS -l walltime=01:20:00                                                                                

source /users/PCON0003/cond0068/.bash_profile_pitzer
cd /users/PAS0654/osu8354/ARA/AraSim/AraSim_versions/ARA02_type_1

./veff.sh 3 &
./veff.sh 4 &

wait

