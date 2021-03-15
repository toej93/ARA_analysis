#!/bin/bash

#SBATCH --job-name=polReco
#SBATCH --nodes=1 --ntasks-per-node=12
#SBATCH --account=PAS0654
#SBATCH --mail-type=END,FAIL
#SBATCH --time=02:10:00
#SBATCH --output=logs/SpiceCoreReco.out    # Standard output and error log
eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
module load python/3.6-conda5.2
# export HDF5_USE_FILE_LOCKING=FALSE
export XDG_RUNTIME_DIR=/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/CenA_sourceSearch/Stokes
export RUNLEVEL=3
export QT_QPA_PLATFORM='offscreen' #Need to add so my python job doesn't crash
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_Reconstruction

python recoPol_data.py 0 &
python recoPol_data.py 1 &
python recoPol_data.py 2 &
python recoPol_data.py 3 &
python recoPol_data.py 4 &
python recoPol_data.py 5 &
python recoPol_data.py 6 &

# python SofTrigSpectra.py &
# python getSofTrigPower.py &

# python getSofTrigSNR.py 0 &
# python getSofTrigSNR.py 1 &
# python getSofTrigSNR.py 2 &
# python getSofTrigSNR.py 3 &
# python getSofTrigSNR.py 4 &
# python getSofTrigSNR.py 5 &
# python getSofTrigSNR.py 6 &


wait
