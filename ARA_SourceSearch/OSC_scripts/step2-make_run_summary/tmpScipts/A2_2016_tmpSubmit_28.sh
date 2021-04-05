#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0213/run006871/event006871.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006869.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0214/run006872/event006872.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006869.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0214/run006873/event006873.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006869.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0214/run006875/event006875.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006874.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0214/run006876/event006876.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006874.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0215/run006877/event006877.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006874.dat &
wait
