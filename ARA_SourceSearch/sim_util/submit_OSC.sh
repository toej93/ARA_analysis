#!/bin/bash

#SBATCH --job-name=getMCPol
#SBATCH --nodes=1 --ntasks-per-node=1
#SBATCH --account=PCON0003
#SBATCH --mail-type=END,FAIL
#SBATCH --time=00:30:00
#SBATCH --output=run_MCPol.log   # Standard output and error log
eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

module load python/3.6-conda5.2
# export HDF5_USE_FILE_LOCKING=FALSE
export XDG_RUNTIME_DIR=/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/
export RUNLEVEL=3
export QT_QPA_PLATFORM='offscreen' #Need to add so my python job doesn't crash

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/sim_util

python getTruthPolarization.py

