#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0918/run004244/event004244.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004235.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0920/run004256/event004256.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004235.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0924/run004274/event004274.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004270.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0924/run004278/event004278.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004270.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0925/run004279/event004279.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004270.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0925/run004281/event004281.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004280.dat &
wait
