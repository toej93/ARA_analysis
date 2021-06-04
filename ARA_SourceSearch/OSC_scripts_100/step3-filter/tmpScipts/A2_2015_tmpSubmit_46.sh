#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0313/run005189/event005189.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005186.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0313/run005190/event005190.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005186.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0313/run005192/event005192.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005191.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0313/run005193/event005193.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005191.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0314/run005194/event005194.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005191.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0314/run005195/event005195.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005191.dat &
wait
