#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0615/run005729/event005729.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005728.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0615/run005730/event005730.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005728.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0615/run005731/event005731.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005728.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0616/run005732/event005732.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005728.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0616/run005734/event005734.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005733.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0616/run005735/event005735.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005733.dat &
wait
