#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0410/run005399/event005399.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005398.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0410/run005400/event005400.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005398.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0410/run005401/event005401.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005398.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0411/run005402/event005402.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005398.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0411/run005404/event005404.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005403.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0411/run005405/event005405.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005403.dat &
wait
