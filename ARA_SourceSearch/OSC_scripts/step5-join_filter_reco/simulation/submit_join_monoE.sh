#!/bin/bash

#SBATCH --nodes=1 --ntasks-per-node=15
#SBATCH --account=PAS0654
#SBATCH --mail-type=FAIL
#SBATCH --time=00:45:00
eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

FILES=${INDIR}/*filter.root

for f in $FILES
  do
    ( 
      ./v2_analysis_join_filter_41_300 2 ${OUTDIR} ${INDIR} "$f" 
    )&
    if (( $(wc -w <<<$(jobs -p)) % 15 == 0 )); then wait; fi #Only submit 15 jobs at a time
  done
wait
