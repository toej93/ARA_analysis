#!/bin/bash

#SBATCH --job-name=AraSim_array_Kotera
#SBATCH --nodes=1 --ntasks-per-node=1
#SBATCH --account=PAS0654
#SBATCH --mail-type=END,FAIL
#SBATCH --time=04:00:00
#SBATCH --array=0-600%100
#SBATCH --output=logs/array_noise_%A-%a.out    # Standard output and error log
eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
# export HDF5_USE_FILE_LOCKING=FALSE
# export XDG_RUNTIME_DIR=/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/CenA_sourceSearch/Stokes
# export RUNLEVEL=3
# export QT_QPA_PLATFORM='offscreen' #Need to add so my python job doesn't crash

AraSimDir='/users/PAS0654/osu8354/AraSim'
SetUpFile='/users/PAS0654/osu8354/AraSim/SETUP/default_fixSrc_A2_c1_Flux.txt'
OutputDir='/fs/scratch/PAS0654/jorge/sim_results/CenAFluxFixed/'
export AraSimDir
export SetUpFile
export OutputDir
cd $AraSimDir
# git checkout fix_phi_calc

./AraSim $SetUpFile $SLURM_ARRAY_TASK_ID $OutputDir &
wait
