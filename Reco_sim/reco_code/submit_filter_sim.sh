#!/bin/bash

#SBATCH --job-name=run_filter_sim
#SBATCH --nodes=1 --ntasks-per-node=10
#SBATCH --account=PAS0654
#SBATCH --mail-type=END,FAIL
#SBATCH --time=00:15:00
#SBATCH --output=run_filter_sim.log   # Standard output and error log
eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

FILES=/fs/scratch/PAS0654/jorge/sim_results/simplified/*.root
for f in $FILES
  do
    (
      ./analysis_filter 1 2 1 /fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/RunSummary /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/Reco_sim/reco_code/Interf_files/filter_files "$f" XX
    )&
    if (( $(wc -w <<<$(jobs -p)) % 10 == 0 )); then wait; fi #Only submit 10 jobs at a time
  done
wait
