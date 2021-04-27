#!/bin/bash

#SBATCH --job-name=getSNR
#SBATCH --nodes=1 --ntasks-per-node=8
#SBATCH --account=PAS0654
#SBATCH --mail-type=END,FAIL
#SBATCH --time=01:30:00
#SBATCH --output=run_SNR.log   # Standard output and error log
eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

module load python/3.6-conda5.2
# export HDF5_USE_FILE_LOCKING=FALSE
export XDG_RUNTIME_DIR=/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/
export RUNLEVEL=3
export QT_QPA_PLATFORM='offscreen' #Need to add so my python job doesn't crash

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/data_util

python compareSNR_bug_NoBug.py bug &
# python compareSNR_bug_NoBug.py no_bug &

wait
