#!/bin/bash

#SBATCH --job-name=run_join_sim
#SBATCH --nodes=1 --ntasks-per-node=15
#SBATCH --account=PAS0654
#SBATCH --mail-type=END,FAIL
#SBATCH --time=00:10:00
#SBATCH --output=run_join_sim.log   # Standard output and error log
eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

FILES=/fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/ProcessedFile/*filter.root

for f in $FILES
  do
    ( 
      ./v2_analysis_join_filter_41_300 2 /fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/Joined /fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/ProcessedFile/ "$f" 
    )&
    if (( $(wc -w <<<$(jobs -p)) % 15 == 0 )); then wait; fi #Only submit 15 jobs at a time
  done
wait
