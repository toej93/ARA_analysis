#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1003/run006277/event006277.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006274.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1003/run006278/event006278.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006274.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1004/run006280/event006280.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006279.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1004/run006281/event006281.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006279.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1004/run006282/event006282.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006279.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1004/run006283/event006283.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006279.dat &
wait
