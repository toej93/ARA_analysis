#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1101/run008171/event008171.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008170.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1101/run008172/event008172.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008170.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1101/run008173/event008173.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008170.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1101/run008174/event008174.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008170.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1102/run008176/event008176.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008175.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1102/run008177/event008177.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008175.dat &
wait
