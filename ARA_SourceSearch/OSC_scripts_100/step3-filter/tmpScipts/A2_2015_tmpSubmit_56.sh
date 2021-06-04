#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0328/run005331/event005331.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005328.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0328/run005332/event005332.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005328.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0328/run005334/event005334.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005333.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0328/run005335/event005335.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005333.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0329/run005336/event005336.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005333.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0329/run005337/event005337.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005333.dat &
wait
