#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0727/run005937/event005937.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005933.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0727/run005939/event005939.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005938.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0727/run005940/event005940.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005938.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0728/run005941/event005941.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005938.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0728/run005942/event005942.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005938.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0728/run005944/event005944.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005943.dat &
wait
