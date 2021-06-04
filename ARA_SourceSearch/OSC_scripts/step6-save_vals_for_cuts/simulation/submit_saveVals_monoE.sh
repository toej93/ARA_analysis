#!/bin/bash

#SBATCH --nodes=1 --ntasks-per-node=15
#SBATCH --account=PAS0654
#SBATCH --mail-type=FAIL
#SBATCH --time=01:45:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

FILES=${INDIR}/*.root

for f in $FILES
  do
    ( 
      ./v2_save_vals 1 2 1 ${ENERGY} 1 ${OUTDIR} 0 1 0.0 0.0 "$f" 
    )&
    if (( $(wc -w <<<$(jobs -p)) % 15 == 0 )); then wait; fi #Only submit 15 jobs at a time
  done
wait
