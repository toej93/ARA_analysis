#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0817/run004085/event004085.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004080.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0817/run004086/event004086.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004080.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0817/run004087/event004087.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004080.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0818/run004089/event004089.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004088.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0818/run004090/event004090.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004088.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0818/run004091/event004091.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004088.dat &
wait
