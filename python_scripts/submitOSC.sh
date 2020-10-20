#/bin/bash

#SBATCH --job-name=pickles
#SBATCH --nodes=1 --ntasks-per-node=10
#SBATCH --output=./log.txt
#SBATCH --error=./error.txt
#SBATCH --account=PCON0003
#SBATCH --mail-type=END,FAIL
#SBATCH  --time=00:01:00

source /users/PCON0003/cond0068/.bash_profile_pitzer_root6
cd /users/PCON0003/cond0068/ARA/AraRoot/analysis/ARA_analysis/python_scripts

python pickle_files.py 1 &
# python pickle_files.py 2 &
# python pickle_files.py 3 &
# python pickle_files.py 4 &
# python pickle_files.py 5 &

wait
