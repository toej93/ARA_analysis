#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0112/run006704/event006704.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0112/run006705/event006705.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0112/run006707/event006707.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0113/run006708/event006708.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0113/run006709/event006709.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0113/run006711/event006711.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
wait
