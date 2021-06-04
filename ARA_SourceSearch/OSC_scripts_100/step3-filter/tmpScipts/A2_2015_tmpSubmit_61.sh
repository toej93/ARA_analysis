#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0404/run005369/event005369.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005368.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0404/run005370/event005370.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005368.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0404/run005371/event005371.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005368.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0405/run005372/event005372.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005368.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0405/run005374/event005374.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005373.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0405/run005375/event005375.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005373.dat &
wait
