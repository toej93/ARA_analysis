#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0330/run003342/event003342.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003334.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0330/run003343/event003343.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003334.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0330/run003344/event003344.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003334.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0330/run003345/event003345.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003334.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0331/run003347/event003347.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003346.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0331/run003348/event003348.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003346.dat &
wait
