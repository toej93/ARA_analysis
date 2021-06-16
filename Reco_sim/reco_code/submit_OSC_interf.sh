#!/bin/bash

#SBATCH --job-name=Interf_simplified
#SBATCH --nodes=1 --ntasks-per-node=7
#SBATCH --account=PAS0654
#SBATCH --mail-type=END,FAIL
#SBATCH --time=02:10:00
#SBATCH --output=logs/interf_simplified.out    # Standard output and error log
eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
module load python/3.6-conda5.2
# export HDF5_USE_FILE_LOCKING=FALSE
export XDG_RUNTIME_DIR=/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/
export RUNLEVEL=3
export QT_QPA_PLATFORM='offscreen' #Need to add so my python job doesn't crash
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/Reco_sim/reco_code/

python recoVertex.py &

wait
