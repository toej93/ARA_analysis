#!/bin/bash

#SBATCH --job-name=run_CW_sim
#SBATCH --nodes=1 --ntasks-per-node=10
#SBATCH --account=PAS0654
#SBATCH --mail-type=END,FAIL
#SBATCH --time=00:35:00
#SBATCH --output=run_filter_sim.log   # Standard output and error log
eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

FILES=/fs/scratch/PAS0654/jorge/sim_results/CenAFluxFixed/*.root
for f in $FILES
  do
    (
      ./v2_analysis_CWID 1 2 1 1 /fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/RunSummary /fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/CWID "$f" XX
    )&
    if (( $(wc -w <<<$(jobs -p)) % 10 == 0 )); then wait; fi #Only submit 10 jobs at a time
  done
wait
