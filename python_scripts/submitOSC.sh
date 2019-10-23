#/bin/bash

#PBS -N get_pickles
#PBS -l nodes=1:ppn=6
#PBS -j oe
#PBS -A PCON0003
#PBS -m e
#PBS -l walltime=05:00:00

source /users/PCON0003/cond0068/.bash_profile_pitzer_root6
cd /users/PCON0003/cond0068/ARA/AraRoot/analysis/ARA_analysis/python_scripts

python pickle_files.py 1 &
python pickle_files.py 2 &
python pickle_files.py 3 &
python pickle_files.py 4 &
python pickle_files.py 5 &

wait
