#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0220/run005084/event005084.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005081.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0220/run005085/event005085.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005081.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0220/run005087/event005087.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005086.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0220/run005088/event005088.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005086.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0221/run005089/event005089.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005086.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0221/run005090/event005090.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005086.dat &
wait
