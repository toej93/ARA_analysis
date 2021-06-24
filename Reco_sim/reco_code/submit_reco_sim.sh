#!/bin/bash

#SBATCH --job-name=run_reco_sim_rad19
#SBATCH --nodes=1 --ntasks-per-node=15
#SBATCH --account=PAS0654
#SBATCH --mail-type=END,FAIL
#SBATCH --time=00:35:00
#SBATCH --output=run_reco_sim_rad19.log   # Standard output and error log
eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/
# RADIUS=6
RADIUS=19

FILES=/fs/scratch/PAS0654/jorge/sim_results/simplified/*.root
for f in $FILES
  do
    (
      ./reco_interf 1 2 1 $RADIUS /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/Reco_sim/reco_code/Interf_files/filter_files /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/Reco_sim/reco_code/Interf_files "$f" 
    )&
    if (( $(wc -w <<<$(jobs -p)) % 15 == 0 )); then wait; fi #Only submit 15 jobs at a time
  done
wait
