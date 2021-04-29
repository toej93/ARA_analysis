#!/bin/bash

#SBATCH --job-name=run_reco_sim_rad6
#SBATCH --nodes=1 --ntasks-per-node=15
#SBATCH --account=PAS0654
#SBATCH --mail-type=END,FAIL
#SBATCH --time=02:35:00
#SBATCH --output=run_reco_sim_rad19.log   # Standard output and error log
eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/
RADIUS=6
#RADIUS=19

FILES=/fs/scratch/PAS0654/jorge/sim_results/CenAFluxFixed/*.root
for f in $FILES
  do
    (
      ./v2_analysis_reco 1 2 1 $RADIUS /fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/ProcessedFile /fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/ProcessedFile "$f" 
    )&
    if (( $(wc -w <<<$(jobs -p)) % 15 == 0 )); then wait; fi #Only submit 15 jobs at a time
  done
wait
