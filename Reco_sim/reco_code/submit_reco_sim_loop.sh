#!/bin/bash

#SBATCH --job-name=run_reco_sim_radiiLoop
#SBATCH --nodes=1 --ntasks-per-node=1
#SBATCH --account=PAS0654
#SBATCH --mail-type=FAIL
#SBATCH --time=01:35:00
#SBATCH --array=101-399%100
#SBATCH --output=logs/run_reco_sim_radiiLoop_%A-%a.out    # Standard output and error log

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./reco_interf_loopRadii 1 2 1 0 /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/Reco_sim/reco_code/Interf_files/filter_files /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/Reco_sim/reco_code/Interf_files/loop/ /fs/scratch/PAS0654/jorge/sim_results/simplified/AraOut.default_A2_c1_E580.txt.run"$SLURM_ARRAY_TASK_ID".root 
