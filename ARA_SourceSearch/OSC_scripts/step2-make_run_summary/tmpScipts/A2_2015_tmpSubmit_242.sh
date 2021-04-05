#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1216/run006571/event006571.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006568.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1216/run006572/event006572.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006568.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1216/run006573/event006573.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006568.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1217/run006574/event006574.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006568.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1217/run006576/event006576.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006575.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1217/run006577/event006577.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006575.dat &
wait
